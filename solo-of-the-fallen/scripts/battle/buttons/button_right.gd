extends Button_base



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("right_carril_E"):
		activate()
	if Input.is_action_just_released("right_carril_E"):
		deactivate()
