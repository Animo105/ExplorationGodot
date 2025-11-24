extends Node2D
class_name EnemySegment

@export var max_distance: float = 18
@export var follow_speed: float = 8.0
@export var rotation_speed: float = 5.0


var current_position : Vector2 = Vector2.ZERO
var previous_segment: Node2D = null

func _ready() -> void:
	current_position = global_position

func set_previous_segment(segment: Node2D):
	previous_segment = segment

func _physics_process(delta):
	global_position = current_position
	if previous_segment == null:
		return
	var target_pos = previous_segment.global_position
	var current_distance = global_position.distance_to(target_pos)
	if current_distance > max_distance:
		var direction = global_position.direction_to(target_pos)
		var move_distance = current_distance - max_distance
		
		global_position += direction * move_distance * 10 * delta
		
	current_position = global_position
