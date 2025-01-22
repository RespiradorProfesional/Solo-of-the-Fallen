extends Node3D

var key_note
# Velocidad de movimiento en unidades por segundo
var speed = 5.0
var direction = Vector3.ZERO

var target_position: Vector3
var travel_time: float
var velocity: Vector3

# Tiempo transcurrido desde que apareció la nota
var elapsed_time: float = 0.0

func set_target(target, time):
	target_position = target
	travel_time = time
	if travel_time > 0:
		velocity = (target_position - global_position) / travel_time
	else:
		velocity = Vector3.ZERO


func _process(delta):
	# Mover la nota hacia la posición objetivo
	global_position += velocity * delta
	elapsed_time += delta
