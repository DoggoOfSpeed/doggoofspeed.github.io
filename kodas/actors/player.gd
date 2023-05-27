extends Spatial

var lokrot = Vector3.ZERO
export var sens = 0.3
export var max_angle = 90
export var min_angle = -80
export var pts = 0 setget update_score
onready var hudtxt = $CanvasLayer/hud/Label
var captured = false

onready var galva = $Camera
onready var cast = $Camera/RayCast

func _ready():
	$CanvasLayer/hud.connect("lmbpress", self, "fgood") 
	$CanvasLayer/hud.connect("rmbpress", self, "fbad") 
	
func _physics_process(_delta):
	galva.rotation_degrees.x = lokrot.x
	galva.rotation_degrees.y = lokrot.y

func _input(event):
	if Input.is_action_just_pressed("bad"):
		capture_check()
		fbad()
	if Input.is_action_just_pressed("good"):
		capture_check()
		fgood()
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		captured = false
	if event is InputEventMouseMotion and captured == true:
		lokrot.y -= event.relative.x*sens
		lokrot.x -= event.relative.y*sens
		lokrot.x = clamp(lokrot.x, min_angle, max_angle)

func fbad():
	if cast.is_colliding():
			var target = cast.get_collider()
			if target.is_in_group("sk"):
				update_score(pts+1)
			else:
				update_score(pts-1)
			target.queue_free()
			
func fgood():
	if cast.is_colliding():
			var target = cast.get_collider()
			if target.is_in_group("sl"):
				update_score(pts+1)
			else:
				update_score(pts-1)
			target.queue_free()
			
func capture_check():
	if captured == false:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			captured = true
			
func update_score(x):
	hudtxt.text = str(x)
	pts = x
