extends Button_base


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_carril_Q"):
		activate()
	if Input.is_action_just_released("left_carril_Q"):
		deactivate()
