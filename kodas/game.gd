extends Spatial


export var zodis: PackedScene
var last = 0
var i = 0
var coord = Vector3(-50.3, -9.665, 3.726)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Timer_timeout():
	randomize()
	while i == last:
		i = randi()%4
	last = i
	var mok = zodis.duplicate().instance()
	if i == 0:
			mok.transform = $Spatial/Spawn1.transform
	if i == 1:
			mok.transform = $Spatial/Spawn2.transform
	if i == 2:
			mok.transform = $Spatial/Spawn3.transform
	if i == 3:
			mok.transform = $Spatial/Spawn4.transform
	add_child(mok)
	pass 
