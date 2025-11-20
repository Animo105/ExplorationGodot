extends CharacterBody2D
## Script pour un ennemi volant en 2D qui suit le joueur et contourne les obstacles
## Compatible avec Godot 4.5

# Références
@export var player: Node2D  ## Le nœud du joueur à suivre
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D


# Paramètres de mouvement
@export_group("Mouvement")
@export var speed: float = 200.0  ## Vitesse de déplacement de l'ennemi (pixels/seconde)
@export var acceleration: float = 10.0  ## Accélération pour un mouvement fluide
@export var rotation_speed: float = 5.0  ## Vitesse de rotation vers la cible

# Paramètres de navigation
@export_group("Navigation")
@export var update_target_interval: float = 0.1  ## Intervalle de mise à jour de la cible (secondes)
@export var min_distance_to_player: float = 50.0  ## Distance minimale à maintenir avec le joueur (pixels)

# Paramètres d'évitement
@export_group("Évitement")
@export var avoidance_enabled: bool = true  ## Activer l'évitement d'obstacles
@export var avoidance_radius: float = 32.0  ## Rayon de l'agent pour l'évitement (pixels)

# Variables internes
var _target_update_timer: float = 0.0
var _safe_velocity: Vector2 = Vector2.ZERO

func _ready() -> void:
	# Vérifier si le NavigationAgent2D existe, sinon en créer un
	if not navigation_agent:
		navigation_agent = get_node_or_null("NavigationAgent2D")
		if not navigation_agent:
			push_error("NavigationAgent2D non trouvé ! Ajoutez un NavigationAgent2D comme enfant de ce nœud.")
			return
	
	# Configuration du NavigationAgent2D
	_setup_navigation_agent()
	
	# Trouver automatiquement le joueur si non assigné
	if not player:
		player = get_tree().get_first_node_in_group("player")
		if not player:
			push_warning("Aucun joueur trouvé ! Ajoutez le joueur au groupe 'player' ou assignez-le manuellement.")
	
	# Attendre que la navigation map soit synchronisée
	call_deferred("_initialize_navigation")

func _setup_navigation_agent() -> void:
	"""Configure les paramètres du NavigationAgent2D"""
	# Paramètres de pathfinding
	navigation_agent.path_desired_distance = 10.0
	navigation_agent.target_desired_distance = min_distance_to_player
	navigation_agent.path_max_distance = 100.0
	
	# Paramètres d'évitement
	navigation_agent.avoidance_enabled = avoidance_enabled
	navigation_agent.radius = avoidance_radius
	navigation_agent.max_speed = speed
	navigation_agent.neighbor_distance = 300.0
	navigation_agent.max_neighbors = 10
	navigation_agent.time_horizon_agents = 1.0
	navigation_agent.time_horizon_obstacles = 1.0
	
	# Connecter le signal pour l'évitement
	if avoidance_enabled and not navigation_agent.velocity_computed.is_connected(_on_velocity_computed):
		navigation_agent.velocity_computed.connect(_on_velocity_computed)

func _initialize_navigation() -> void:
	"""Initialise la navigation après que la map soit prête"""
	if player:
		navigation_agent.target_position = player.global_position

func _physics_process(delta: float) -> void:
	if not player or not navigation_agent:
		return
	
	# Mettre à jour la cible périodiquement
	_target_update_timer += delta
	if _target_update_timer >= update_target_interval:
		_target_update_timer = 0.0
		navigation_agent.target_position = player.global_position
	
	# Vérifier si la navigation est terminée
	if navigation_agent.is_navigation_finished():
		return
	
	# Obtenir la prochaine position du chemin
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	
	# Calculer la direction vers la prochaine position
	var direction: Vector2 = (next_path_position - global_position).normalized()
	
	# Calculer la vélocité désirée
	var desired_velocity: Vector2 = direction * speed
	
	# Si l'évitement est activé, mettre à jour la vélocité de l'agent
	if avoidance_enabled:
		navigation_agent.velocity = desired_velocity
		# La vélocité sécurisée sera reçue via le signal velocity_computed
		# et appliquée dans _on_velocity_computed()
	else:
		# Sans évitement, appliquer directement la vélocité
		_move_with_velocity(desired_velocity, delta)
	
	# Rotation vers la direction de mouvement
	_rotate_towards_direction(direction, delta)

func _move_with_velocity(target_velocity: Vector2, delta: float) -> void:
	"""Déplace l'ennemi avec une vélocité donnée"""
	# Interpolation pour un mouvement fluide
	velocity = velocity.lerp(target_velocity, acceleration * delta)
	
	# Déplacer l'ennemi
	move_and_slide()

func _rotate_towards_direction(direction: Vector2, delta: float) -> void:
	"""Fait pivoter l'ennemi vers la direction de mouvement"""
	if direction.length() > 0.01:
		# Calculer l'angle cible
		var target_angle: float = direction.angle()
		
		# Interpolation pour une rotation fluide
		rotation = lerp_angle(rotation, target_angle, rotation_speed * delta)

func _on_velocity_computed(safe_velocity: Vector2) -> void:
	"""Callback appelé par NavigationAgent2D avec la vélocité sécurisée après calcul d'évitement"""
	_safe_velocity = safe_velocity
	_move_with_velocity(safe_velocity, get_physics_process_delta_time())

# Fonctions utilitaires optionnelles

func set_target_player(new_player: Node2D) -> void:
	"""Change le joueur cible"""
	player = new_player
	if player and navigation_agent:
		navigation_agent.target_position = player.global_position

func get_distance_to_player() -> float:
	"""Retourne la distance actuelle au joueur"""
	if player:
		return global_position.distance_to(player.global_position)
	return INF

func is_player_in_range(range_distance: float) -> bool:
	"""Vérifie si le joueur est dans une certaine portée"""
	return get_distance_to_player() <= range_distance
