extends Node3D

@export var lerp_speed = 3.0
@export var target : Node


func _physics_process(delta):
	if !target:
		return

	global_position = global_position.lerp(target.global_position, lerp_speed * delta)
