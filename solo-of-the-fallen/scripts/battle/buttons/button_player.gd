extends Node3D
class_name Button_base

@onready var area = $Area3D

# Called when the node entezrs the scene tree for the first time.
func _ready() -> void:
	area.monitoring = false

func activate(action):
	area.monitoring = true
	if action == 1:
		pass
	else : 
		pass

func deactivate(action):
	area.monitoring = false
	if action == 1:
		pass
	else : 
		pass
