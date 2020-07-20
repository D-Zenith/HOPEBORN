extends KinematicBody
var speed = 10

func _process(delta):
	var x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var z = - Input.get_action_strength("ui_up") + Input.get_action_strength("ui_down") 
	move_and_slide(Vector3(x,0,z) * speed)
