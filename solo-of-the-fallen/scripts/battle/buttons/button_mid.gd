extends Button_base


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("mid_carril_W"):
		activate()
	if Input.is_action_just_released("mid_carril_W"):
		deactivate()
