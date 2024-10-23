extends RigidBody3D

@export var acceleration = 35.0

var input = Vector2.ZERO

@onready var ground_ray = get_node('raycast')
@onready var camera = get_node('/root/main/world/camera')


func _physics_process(_delta):
	if not ground_ray.is_colliding():
		return

	var force = Vector3(input.x, 0, input.y).rotated(Vector3.UP, deg_to_rad(camera.global_rotation.y)) * acceleration

	apply_central_force(force)
	
func _process(_delta):
	print(global_position)
	input = Input.get_vector("left", "right", "forward", "back")

func align_with_y(xform, new_y):
	xform.basis.y = new_y
	xform.basis.x = -xform.basis.z.cross(new_y)
	return xform.orthonormalized()
