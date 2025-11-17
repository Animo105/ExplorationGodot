extends Node2D
@export var camera_follow : Node2D

func _process(delta: float) -> void:
	position = lerp(position, camera_follow.position, 0.1)
