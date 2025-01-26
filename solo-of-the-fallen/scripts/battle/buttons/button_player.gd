extends Node3D
class_name Button_base

@onready var timer=$Timer
@onready var area = $Area3D
var key_held=false

# Called when the node entezrs the scene tree for the first time.
func _ready() -> void:
	area.monitoring = false

func activate():
	timer.start()
	area.monitoring = true


func deactivate():
	timer.stop()
	key_held=false
	area.monitoring = false


func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.get_parent() is note and key_held==false:
		timer.start()
		area.get_parent().queue_free()


func _on_timer_timeout() -> void:
	key_held=true
