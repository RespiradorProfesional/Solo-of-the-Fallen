extends Node3D


@onready var position_left =$position_left
@onready var position_mid =$position_mid
@onready var position_right =$position_right
@onready var note_container =$note_container
@onready var timer = $Timer

# Define the speed of the notes (you can adjust this value as needed)
const SPEED = 200.0

# Store the input data
var note_key = []
var note_time_respawn = []

# Índice para controlar el progreso en el array
var current_index = 0

func _ready():
	# Ruta del archivo
	var file_path = "res://mr_moondal.txt"

	# Leer y procesar el archivo
	var file_content = load_file_as_text(file_path)
	if file_content != null:
		process_commands(file_content)
	timer.start()

func _process(delta: float) -> void:
	var current_time =timer.wait_time - timer.time_left
	print(current_time)
	# Verificar si el tiempo actual coincide con el próximo valor en el array
	while current_index < note_time_respawn.size() and current_time >= note_time_respawn[current_index]:
		create_note(note_key[current_index])
		# Avanzar al siguiente elemento del array
		current_index += 1


func create_note(key):
	# Create a new instance of the note (assuming you have a Note scene)
	var note
	
	match key:
		"Q":
			setting_note("Q",position_left.global_position)
		"W":
			setting_note("W",position_mid.global_position)
		"E":
			setting_note("E",position_right.global_position)
		"A":
			setting_note("A",position_left.global_position)
		"S":
			setting_note("S",position_mid.global_position)
		"D":
			setting_note("D",position_right.global_position)

func setting_note(key_node,position_node):
	var note = load("res://scenes/battle/notes/notes_base.tscn").instantiate()
	note_container.add_child(note)
	note.global_position = position_node
	note.key_note = key_node
	






func load_file_as_text(file_path: String):
	var file_resource = FileAccess.open(file_path, FileAccess.READ)
	if file_resource:
		return file_resource.get_as_text()
	else:
		print("File not found: %s" % file_path)
		return ""

func process_commands(file_content: String):
	var lines = file_content.split("\n")
	
	for i in range(lines.size()):
		var parts = lines[i].strip_edges().split(" : ")
		if parts.size() == 3 and parts[2] == "pressed":
			note_key.append(parts[0])
			note_time_respawn.append(float(parts[1]))
	
