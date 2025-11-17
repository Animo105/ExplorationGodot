extends Node2D

func _process(delta: float) -> void:
	var bodies = $Area2D.get_overlapping_bodies()
	for body in bodies :
		if (body.name == "Player") :
			get_parent().get_node("spawnpoint").global_position = global_position
