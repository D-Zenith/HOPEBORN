extends KinematicBody
export var speed = 3.7

func _process(delta):
	
	var x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var z = - Input.get_action_strength("move_up") + Input.get_action_strength("move_down")
	move_and_slide(Vector3(x,0,z) * speed)
	
#	if Input.is_action_just_pressed("cam_orb_left"):
#		print("orb_left")
#		$camera_rig.rotation.y=lerp_angle(rotation.y,rotation.y-deg2rad(90),1)
#		print($camera_rig.rotation_degrees.y)
#	if Input.is_action_just_pressed("cam_orb_right"):
#		print("orb_right")
#		print($camera_rig.rotation_degrees.y)
#		$camera_rig.rotation.y=lerp_angle(rotation.y,rotation.y+deg2rad(90),1)
