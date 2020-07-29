extends KinematicBody
export var speed = 3.7
export var camera_on = true
var dir = []

func _ready():
	$Camera.current = camera_on
func _process(delta):
	
	var x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var z = - Input.get_action_strength("move_up") + Input.get_action_strength("move_down")
	var velocity = Vector3(x,0,z).normalized()
	move_and_slide(velocity * speed)
	get_input_for_anim()
#	if Input.is_action_just_pressed("cam_orb_left"):
#		print("orb_left")
#		$camera_rig.rotation.y=lerp_angle(rotation.y,rotation.y-deg2rad(90),1)
#		print($camera_rig.rotation_degrees.y)
#	if Input.is_action_just_pressed("cam_orb_right"):
#		print("orb_right")
#		print($camera_rig.rotation_degrees.y)
#		$camera_rig.rotation.y=lerp_angle(rotation.y,rotation.y+deg2rad(90),1)

#func _input(event):
#	if event.is_action_pressed("move_left"):
#		$AnimationPlayer.play("walk_left")
#		dir.append("left")
#	elif event.is_action_released("move_left"):
#		if dir[0] == "left":
#			$AnimationPlayer.stop()
#			$Sprite3D.frame = 18
#		dir.erase("left")
#	if event.is_action_pressed("move_right"):
#		$AnimationPlayer.play("walk_right")
#		dir.append("right")
#	elif event.is_action_released("move_right"):
#		if dir[0] == "right":
#			$AnimationPlayer.stop()
#			$Sprite3D.frame = 6
#		dir.erase("right")
#
#	if event.is_action_pressed("move_up"):
#		$AnimationPlayer.play("walk_forward")
#		dir.append("up")
#	elif event.is_action_released("move_up"):
#		if dir[0] == "up":
#			$AnimationPlayer.stop()
#			$Sprite3D.frame = 12
#		dir.erase("up")
#
#	if event.is_action_pressed("move_down"):
#		$AnimationPlayer.play("walk_backwards")
#		dir.append("down")
#	elif event.is_action_released("move_down") and dir[0] == "down":
#		if dir[0] == "down":
#			$AnimationPlayer.stop()
#			$Sprite3D.frame = 0
#		dir.erase("down")

func get_input_for_anim():
	if Input.is_action_pressed("move_left"):
		$AnimationPlayer.play("walk_left")
	elif Input.is_action_just_released("move_left") and $AnimationPlayer.current_animation == "walk_left":
		$AnimationPlayer.stop()
		$Sprite3D.frame = 18

	elif Input.is_action_pressed("move_right"):
		$AnimationPlayer.play("walk_right")
	elif Input.is_action_just_released("move_right") and $AnimationPlayer.current_animation == "walk_right":
		$AnimationPlayer.stop()
		$Sprite3D.frame = 6

	elif Input.is_action_pressed("move_up"):
		$AnimationPlayer.play("walk_forward")
	elif Input.is_action_just_released("move_up") and $AnimationPlayer.current_animation == "walk_forward":
		$AnimationPlayer.stop()
		$Sprite3D.frame = 12

	elif Input.is_action_pressed("move_down"):
		$AnimationPlayer.play("walk_backwards")
	elif Input.is_action_just_released("move_down") and $AnimationPlayer.current_animation == "walk_backwards":
		$AnimationPlayer.stop()
		$Sprite3D.frame = 0
	if Input.is_action_pressed("move_left") and  Input.is_action_pressed("move_right") or \
		Input.is_action_pressed("move_up") and  Input.is_action_pressed("move_down"):
		$AnimationPlayer.stop()
		$Sprite3D.frame = 0
