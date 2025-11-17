extends CharacterBody2D
class_name Player

@export var speed := 200
@export var gravity := 1200
@export var jump_force := -300
var anim_timer = 0.0
@export var anim_speed : float = 0.07

# Influence du maintien du saut
@export var jump_gravity_multiplier := 0.5   # gravité réduite pendant maintien
@export var fall_gravity_multiplier := 1.8   # gravité augmentée quand tu relâches

func _ready() -> void:
	var spawn = get_parent().get_node("spawnpoint")
	global_position = spawn.global_position

func _physics_process(delta):
	# ----- GRAVITÉ -----
	var current_gravity = gravity

	if velocity.y < 0:  # Le joueur monte
		if Input.is_action_pressed("jump"):
			current_gravity *= jump_gravity_multiplier  # montée plus lente
		else:
			current_gravity *= fall_gravity_multiplier  # retombe vite si relâche
	elif velocity.y > 0:  # Le joueur descend
		current_gravity *= fall_gravity_multiplier

	velocity.y += current_gravity * delta

	# ----- DÉPLACEMENT HORIZONTAL -----
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = lerp(velocity.x, direction * speed, 0.3)
	if (direction < 0) :
		$Sprite2D.scale.x = 1
	if (direction > 0) :
		$Sprite2D.scale.x = -1
	if (direction != 0) :
		anim_timer += delta
		if (anim_timer >= anim_speed) :
			if ($Sprite2D.frame == 3) :
				$Sprite2D.frame = 2
			else :
				$Sprite2D.frame = 3
			anim_timer = 0
	else :
		$Sprite2D.frame = 3

	# ----- SAUT -----
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
	if (!is_on_floor()) :
		$Sprite2D.frame = 2;

	# ----- APPLIQUER LE MOUVEMENT -----
	move_and_slide()
	
	if Input.is_key_pressed(Key.KEY_R) :
		respawn()

func respawn() :
	var spawn = get_parent().get_node("spawnpoint")
	global_position = spawn.global_position
	velocity = Vector2.ZERO
