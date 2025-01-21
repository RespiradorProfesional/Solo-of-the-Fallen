extends Node3D


var text =""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_carril_Q"):
		create_point("Q","pressed")
	if Input.is_action_just_pressed("left_carril_A"):
		create_point("A","pressed")
	if Input.is_action_just_released("left_carril_Q"):
		create_point("Q","relased")
	if Input.is_action_just_released("left_carril_A"):
		create_point("A","relased")
	if Input.is_action_just_pressed("right_carril_E"):
		create_point("E","pressed")
	if Input.is_action_just_pressed("right_carril_D"):
		create_point("D","pressed")
	if Input.is_action_just_released("right_carril_E"):
		create_point("E","relased")
	if Input.is_action_just_released("right_carril_D"):
		create_point("D","relased")
	if Input.is_action_just_pressed("mid_carril_W"):
		create_point("W","pressed")
	if Input.is_action_just_pressed("mid_carril_S"):
		create_point("S","pressed")
	if Input.is_action_just_released("mid_carril_W"):
		create_point("W","relased")
	if Input.is_action_just_released("mid_carril_S"):
		create_point("S","relased")
	
	if Input.is_action_just_pressed("test"):
		# Crear o abrir un archivo para escritura
		var file = FileAccess.open("res://mr_moondal.txt", FileAccess.WRITE)
		
		if file:
			# Escribir contenido en el archivo
			file.store_string(text)
			
			# Cerrar el archivo
			file.close()
		else:
			print("No se pudo abrir el archivo.")

func create_point(input, entry):
	var operacion=$Timer.wait_time - $Timer.time_left
	text+= input + " : " + str(operacion) + " : " + entry + "\n"
