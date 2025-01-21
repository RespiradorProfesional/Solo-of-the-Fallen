extends Button_base


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(area.is_monitoring())
	if Input.is_action_just_pressed("left_carril_Q"):
		activate(1)
	if Input.is_action_just_pressed("left_carril_A"):
		activate(2)
	if Input.is_action_just_released("left_carril_Q"):
		deactivate(1)
	if Input.is_action_just_released("left_carril_A"):
		deactivate(2)
