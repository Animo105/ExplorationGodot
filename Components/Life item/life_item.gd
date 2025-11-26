extends Node2D


func _on_life_pickup_body_entered(body: Node2D) -> void:
	if body is Player:
		body.add_life()
		body.play_heart_pickup()
		queue_free()
