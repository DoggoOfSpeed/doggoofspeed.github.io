extends Spatial

var lokrot = Vector3.ZERO
export var sens = 0.3
export var max_angle = 90
export var min_angle = -80
export var pts = 0
onready var hudtxt = $CanvasLayer/hud/Label

onready var galva = $Camera
onready var cast = $Camera/RayCast

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$CanvasLayer/hud.connect("lmbpress", self, "fgood") 
	$CanvasLayer/hud.connect("rmbpress", self, "fbad") 
	
func _physics_process(_delta):
	galva.rotation_degrees.x = lokrot.x
	galva.rotation_degrees.y = lokrot.y

func _input(event):
	if event is InputEventMouseMotion:
		lokrot.y -= event.relative.x*sens
		lokrot.x -= event.relative.y*sens
		lokrot.x = clamp(lokrot.x, min_angle, max_angle)
		
func _process(_delta):
	if Input.is_action_just_pressed("bad"):
		fbad()
	if Input.is_action_just_pressed("good"):
		fgood()

func fbad():
	if cast.is_colliding():
			var target = cast.get_collider()
			if target.is_in_group("sk"):
				pts += 1
			else:
				pts -= 1
			target.queue_free()
			hudtxt.text = str(pts);
			
func fgood():
	if cast.is_colliding():
			var target = cast.get_collider()
			if target.is_in_group("sl"):
				pts += 1
			else:
				pts -= 1
			target.queue_free()
			hudtxt.text = str(pts);
