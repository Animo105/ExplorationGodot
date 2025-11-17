@abstract
extends Area2D
class_name Collectible

func _init() -> void:
	body_entered.connect(_on_player_entered)

func _on_player_entered(body : Node2D):
	if body is Player:
		collect()

@abstract func collect()
