extends Node2D
@export var camera_follow : Node2D

func _process(delta: float) -> void:
	position = lerp(position, camera_follow.position, 0.1)

func shake() :
	$AnimationPlayer.play("camera_shake")
	
func zoom_boss():
	$AnimationPlayer.play("camera_zoom")

func to_default():
	$AnimationPlayer.play("to_default")
