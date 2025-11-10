extends CharacterBody2D

# Variables de base
@export var speed := 200
@export var jump_force := -400
@export var gravity := 900

func _physics_process(delta):
	# Appliquer la gravité
	if not is_on_floor():
		velocity.y += gravity * delta

	# Mouvement gauche/droite
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed

	# Saut
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force

	# Appliquer le mouvement
	move_and_slide()
