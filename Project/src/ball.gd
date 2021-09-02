extends RigidBody2D

var angle = 0
export var degrees_per_second = 200

func _process(delta):
	if Input.is_action_just_pressed("launch"):
		var impulse = Vector2.RIGHT.rotated(deg2rad(angle)) * 50
		apply_impulse(Vector2.ZERO, impulse)
	if Input.is_action_pressed("increase angle"):
		angle -= degrees_per_second * delta
		print(angle)
	if Input.is_action_pressed("decrease angle"):
		angle += degrees_per_second * delta
		print(angle)
		
