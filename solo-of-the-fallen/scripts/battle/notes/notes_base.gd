extends Node3D

var key_note
# Velocidad de movimiento en unidades por segundo
var speed = 5.0
var direction = Vector3.ZERO

func _process(delta: float) -> void:
	# Define la dirección (1 para +X, -1 para -X)
	direction = Vector3(0, 0, 1)  # Mover hacia +X
	# direction = Vector3(-1, 0, 0)  # Mover hacia -X

	# Actualiza la posición del nodo
	global_transform.origin += direction * speed * delta
