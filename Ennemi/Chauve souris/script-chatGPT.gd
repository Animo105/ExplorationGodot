extends CharacterBody2D

@export var speed: float = 120.0
@export var avoid_strength: float = 200.0
@export var obstacle_check_distance: float = 60.0
@export var player_path: NodePath

var player: Node2D

func _ready():
	player = get_node(player_path)

func _physics_process(_delta):
	if not player:
		return

	# --- 1) Direction vers le joueur ---
	var desired = (player.global_position - global_position).normalized() * speed

	# --- 2) Évitement d'obstacles ---
	var avoid = Vector2.ZERO
	var dirs = [
		Vector2.RIGHT,
		Vector2.LEFT,
		Vector2.UP,
		Vector2.DOWN
	]

	for dir in dirs:
		var query = PhysicsRayQueryParameters2D.create(
			global_position,
			global_position + dir * obstacle_check_distance
		)
		query.exclude = [self]
		query.collision_mask = collision_mask
		
		var hit = get_world_2d().direct_space_state.intersect_ray(query)

		if hit:
			# On pousse l’ennemi dans la direction opposée à l’obstacle
			avoid -= dir * avoid_strength

	# --- 3) Combinaison ---
	var final = desired + avoid

	if final.length() > speed:
		final = final.normalized() * speed

	velocity = final
	move_and_slide()
