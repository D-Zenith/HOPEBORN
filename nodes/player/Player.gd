extends KinematicBody
export var speed = 3.7
var dir = ""
func _process(delta):
	
	var x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var z = - Input.get_action_strength("move_up") + Input.get_action_strength("move_down")
	var velocity = Vector3(x,0,z).normalized()
	move_and_slide(velocity * speed)
	
#	if Input.is_action_just_pressed("cam_orb_left"):
#		print("orb_left")
#		$camera_rig.rotation.y=lerp_angle(rotation.y,rotation.y-deg2rad(90),1)
#		print($camera_rig.rotation_degrees.y)
#	if Input.is_action_just_pressed("cam_orb_right"):
#		print("orb_right")
#		print($camera_rig.rotation_degrees.y)
#		$camera_rig.rotation.y=lerp_angle(rotation.y,rotation.y+deg2rad(90),1)

func _input(event):
	if event.is_action_pressed("move_left"):
		$AnimationPlayer.play("walk_left")
		dir = "left"
	elif event.is_action_released("move_left") and dir == "left":
		$AnimationPlayer.stop()
		$Sprite3D.frame = 18

	if event.is_action_pressed("move_right"):
		$AnimationPlayer.play("walk_right")
		dir = "right"
	elif event.is_action_released("move_right") and dir == "right":
		$AnimationPlayer.stop()
		$Sprite3D.frame = 6

	if event.is_action_pressed("move_up"):
		$AnimationPlayer.play("walk_forward")
		dir = "up"
	elif event.is_action_released("move_up") and dir == "up" :
		$AnimationPlayer.stop()
		$Sprite3D.frame = 12

	if event.is_action_pressed("move_down"):
		$AnimationPlayer.play("walk_backwards")
		dir = "down"
	elif event.is_action_released("move_down") and dir == "down":
		$AnimationPlayer.stop()
		$Sprite3D.frame = 0
