extends Control

signal lmbpress
signal rmbpress

var sec = 185

func _ready():
	$Label.text = "0";
	pass

func _process(_delta):
	$fps.text = str(Engine.get_frames_per_second())

func _on_LMB_button_down():
	emit_signal("lmbpress")
	pass # Replace with function body.

func _on_RMB_button_down():
	emit_signal("rmbpress")
	pass # Replace with function body.


func _on_Timer_timeout():
	sec -= 1
	$Label2.text = ("%02d:%02d" % [sec/60, sec%60])
	pass # Replace with function body.
