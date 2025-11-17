extends Collectible
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	var mat := ShaderMaterial.new()
	mat.shader = preload("res://Shaders/shine.gdshader")
	$Sprite2D.material = mat
	animation_player.play("default")

func collect():
	animation_player.play("grabbed")
	await animation_player.animation_finished
	queue_free()
