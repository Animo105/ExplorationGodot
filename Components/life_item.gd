extends Node2D


func _on_life_pickup_body_entered(body: Node2D) -> void:
	var player = get_parent().get_node("Player")
	player.add_life()
	queue_free()
