extends Node2D

func _ready():
	var _ignore_angle = $Ball.connect("angle_changed", self, "_on_Ball_angle_changed")
	var _ignore_power = $Ball.connect("power_changed", self, "_on_Ball_power_changed")

func _on_Ball_angle_changed(new_angle):
	$AngleLabel.text = 'Angle: %.2f' % -new_angle

func _on_Ball_power_changed(new_power):
	$PowerLabel.text = 'Power: %.2f' % new_power
