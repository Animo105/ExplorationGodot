extends Node2D
func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if (body.name == "Player") :
			get_parent().get_node("Player").respawn()
