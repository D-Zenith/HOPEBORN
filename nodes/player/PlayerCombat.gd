extends KinematicBody

func _input(event):
	if event.is_action_pressed("move_left"):
		translation.x = max(translation.x - 1, -1)
	elif event.is_action_pressed("move_right"):
		translation.x = min(translation.x + 1, 1)
