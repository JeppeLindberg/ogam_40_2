extends Node3D


var saved_rotation = Vector3.ZERO;


func _ready() -> void:
	saved_rotation = global_rotation_degrees


func _process(_delta: float) -> void:
	global_rotation_degrees = saved_rotation;
