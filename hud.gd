extends CanvasLayer
var current_health := 3

func update_lives(health):
	for i in $GridContainer.get_children() :
		if i is TextureRect :
			i.queue_free()
	current_health = health
	for i in current_health :
		var life = TextureRect.new()
		life.texture = load("res://Assets/tile_0044.png")
		$GridContainer.add_child(life)
