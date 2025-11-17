extends Area2D

const JUMP_FORCE = -1100

func _ready() -> void:
	body_entered.connect(_player_entered)

func _player_entered(body : Node2D):
	if body is Player:
		body.velocity.y = JUMP_FORCE
