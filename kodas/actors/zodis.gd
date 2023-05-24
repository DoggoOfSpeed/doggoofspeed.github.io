extends RigidBody
	
func dorot (var stri):
	$MeshInstance.mesh.text = stri
	$CollisionShape.make_convex_from_brothers()
