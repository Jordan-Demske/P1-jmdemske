extends Node2D

func _ready():
	var _ignored = $Ball.connect("angle_changed", self, "_on_Ball_angle_changed")

func _on_Ball_angle_changed(new_angle):
	$AngleLabel.text = 'Angle: %.2f' % -new_angle
