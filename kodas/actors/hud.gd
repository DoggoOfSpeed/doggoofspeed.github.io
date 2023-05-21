extends Control

func _ready():
	$Label.text = "0";
	pass

func _process(_delta):
	$fps.text = str(Engine.get_frames_per_second())
