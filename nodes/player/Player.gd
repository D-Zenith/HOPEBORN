extends KinematicBody
export var speed = 2

func _process(delta):
	var x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var z = - Input.get_action_strength("move_up") + Input.get_action_strength("move_down")
	move_and_slide(Vector3(x,0,z) * speed)
