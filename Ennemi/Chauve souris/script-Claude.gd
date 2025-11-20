extends CharacterBody2D

# Paramètres de l'ennemi
@export var speed: float = 200.0
@export var acceleration: float = 5.0
@export var detection_range: float = 400.0
@export var attack_range: float = 100.0

# Référence au joueur
@onready var player: Node2D = get_tree().get_first_node_in_group("player")
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D


# États
enum State { IDLE, CHASE, ATTACK }
var current_state: State = State.IDLE

func _ready():
	# Configuration de l'agent de navigation
	navigation_agent.path_desired_distance = 10.0
	navigation_agent.target_desired_distance = 10.0
	
	# Attendre que la navigation soit prête
	call_deferred("actor_setup")

func actor_setup():
	# Attendre un frame pour que le NavigationServer soit synchronisé
	await get_tree().physics_frame
	set_movement_target(global_position)

func _physics_process(delta: float):
	if not player:
		return
	
	var distance_to_player = global_position.distance_to(player.global_position)
	
	# Gestion des états
	match current_state:
		State.IDLE:
			if distance_to_player < detection_range:
				current_state = State.CHASE
		
		State.CHASE:
			if distance_to_player > detection_range * 1.5:
				current_state = State.IDLE
			elif distance_to_player < attack_range:
				current_state = State.ATTACK
			else:
				chase_player()
		
		State.ATTACK:
			if distance_to_player > attack_range * 1.2:
				current_state = State.CHASE
			else:
				attack_player()
	
	# Déplacement
	if navigation_agent.is_navigation_finished():
		return
	
	var next_path_position = navigation_agent.get_next_path_position()
	var direction = (next_path_position - global_position).normalized()
	
	# Mouvement fluide avec accélération
	var target_velocity = direction * speed
	velocity = velocity.lerp(target_velocity, acceleration * delta)
	
	move_and_slide()
	
	# Rotation vers la direction du mouvement (optionnel pour 2D)
	if velocity.length() > 0.1:
		rotation = velocity.angle()

func chase_player():
	# Mettre à jour la cible vers le joueur
	set_movement_target(player.global_position)

func attack_player():
	# Logique d'attaque (à personnaliser)
	var direction_to_player = (player.global_position - global_position).normalized()
	rotation = direction_to_player.angle()
	# Ajouter ici votre logique d'attaque (tir, mêlée, etc.)

func set_movement_target(target_position: Vector2):
	navigation_agent.target_position = target_position
