extends Control

func _ready():
	$Label.text = "0";
	pass

func _process(_delta):
	$fps.text = str(Engine.get_frames_per_second())


func _on_LMB_button_down():
	InputEventMouseButton.new()
	get_tree().input_event()
	pass # Replace with function body.


func _on_RMB_button_down():
	pass # Replace with function body.
