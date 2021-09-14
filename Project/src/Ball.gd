extends RigidBody2D

signal angle_changed(new_angle)

var _angle = 0
export var degrees_per_second = 20

func _process(delta):
	if Input.is_action_just_pressed("launch"):
		var impulse = Vector2.RIGHT.rotated(deg2rad(_angle)) * 50
		apply_impulse(Vector2.ZERO, impulse)
		
	var angle_change = _process_angle_change_input(delta)
	_angle = clamp(_angle + angle_change, -90, 0)
	emit_signal("angle_changed", _angle)
	
func _process_angle_change_input(delta):
	if Input.is_action_pressed("increase angle"):
		return -degrees_per_second * delta
	if Input.is_action_pressed("decrease angle"):
		return degrees_per_second * delta
	return 0
		
