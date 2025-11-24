# Script de la tête (ennemi principal)
extends CharacterBody2D

@onready var left: RayCast2D = $left
@onready var right: RayCast2D = $right

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
	
	velocity = dir * speed
	if velocity.x > 0:
		if !right.is_colliding():
			print("turn left")
			dir = Vector2.LEFT
	if velocity.x < 0:
		if !left.is_colliding():
			dir = Vector2.RIGHT
	move_and_slide()
