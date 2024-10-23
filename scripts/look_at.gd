extends Camera3D

@export var target : Node


func _physics_process(_delta):
	if !target:
		return

	look_at(target.global_position, Vector3.UP)
