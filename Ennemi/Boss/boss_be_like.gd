# Script de la tête (ennemi principal)
extends CharacterBody2D

@onready var left: RayCast2D = $left
@onready var right: RayCast2D = $right
var dead = false

var dir : Vector2 = Vector2.LEFT

@export var speed: float = 100.0
var segments: Array[Node2D] = []
@export var player : Node2D
func _ready():
	# Récupérer tous les segments enfants
	for child in get_children():
		if child.has_method("set_previous_segment"):
			segments.append(child)
	
	# Configurer la chaîne de segments
	for i in range(segments.size()):
		if i == 0:
			segments[i].set_previous_segment(self)
		else:
			segments[i].set_previous_segment(segments[i - 1])

func _physics_process(_delta):
	if not dead :
		velocity = dir * speed
		if velocity.x > 0:
			if !right.is_colliding():
				print("turn left")
				dir = Vector2.LEFT
		if velocity.x < 0:
			if !left.is_colliding():
				dir = Vector2.RIGHT
		move_and_slide()
	else :
		pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	var player = get_parent().get_node("Player")
	if body.name == "Player" :
		var is_dead = true
		for child in get_children():
			if child.has_method("set_previous_segment"):
				is_dead = false
		if is_dead and player.position.y < position.y - 5 :
			dead = true
			player.set_dead(true)
			get_parent().get_node("Camera").zoom_boss()
			await get_tree().create_timer(4.0).timeout
			$explosion.emitting = true
			$Sprite2D.visible = false
			get_parent().get_node("Camera").to_default()
			await get_tree().create_timer(1.0).timeout
			queue_free()
			player.set_dead(false)
			
		else :
			player.respawn()
			if player.global_position.x - global_position.x >= 0 :
				player.velocity.x = 2500
			else :
				player.velocity.x = -2500
