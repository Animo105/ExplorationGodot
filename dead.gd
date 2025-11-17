extends Node2D

func _process(delta: float) -> void:
	var bodies = $Area2D2.get_overlapping_bodies()
	for body in bodies :
		if (body.name == "Player") :
			get_parent().get_node("Player").respawn()
