extends RigidBody2D

signal angle_changed(new_angle)
signal power_changed(new_power)

var _angle = 0
export var degrees_per_second = 20

var _power = 150
export var power_per_second = 50

func _process(delta):
	if Input.is_action_just_pressed("launch"):
		var impulse = Vector2.RIGHT.rotated(deg2rad(_angle)) * _power
		apply_impulse(Vector2.ZERO, impulse)
		$LaunchSound.play()
		
	var angle_change = _process_angle_change_input(delta)
	_angle = clamp(_angle + angle_change, -90, 0)
	emit_signal("angle_changed", _angle)
	
	var power_change = _process_power_change_input(delta)
	_power = clamp(_power + power_change, 0, 300)
	emit_signal("power_changed", _power)
	
func _process_angle_change_input(delta):
	if Input.is_action_pressed("increase angle"):
		return -degrees_per_second * delta
	if Input.is_action_pressed("decrease angle"):
		return degrees_per_second * delta
	return 0
	
func _process_power_change_input(delta):
	if Input.is_action_pressed("increase power"):
		return power_per_second * delta
	if Input.is_action_pressed("decrease power"):
		return -power_per_second * delta
	return 0
