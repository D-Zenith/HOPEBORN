extends KinematicBody

export var speed = 20
export var jump_str=40
export var camera_on = true
export var gravity = -10

#higher gravity make it slower to walk and shorter jumps
#tbh the jumps are too fast 
var dir = []
var y=0
var inair
func _ready():
	$Camera.current = camera_on
	inair=false

func _input(event):
	if event.is_action_pressed("jump") and !inair:
		inair=true
		y +=jump_str
# one press actions here

func _process(delta):
	var x = (Input.get_action_strength("move_right") - Input.get_action_strength("move_left"))*speed
	y += gravity()
	var z =  (-Input.get_action_strength("move_up") + Input.get_action_strength("move_down"))*speed
	#components assigned
	var velocity = Vector3(x,0,z)
	velocity.y=y
	#vel assigned
	var c = move_and_collide(velocity*delta)
	#movement 
	get_input_for_anim()
	#sync anims
	if c:
		print("on land")
		y=0
		inair=false
	# collision check can be used for bouncing later
	
# made a gravity func in case we need variable gravity later
func gravity():
	return gravity

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
		$Sprite3D.frame = 15

	elif Input.is_action_pressed("move_right"):
		$AnimationPlayer.play("walk_right")
	elif Input.is_action_just_released("move_right") and $AnimationPlayer.current_animation == "walk_right":
		$AnimationPlayer.stop()
		$Sprite3D.frame = 5

	elif Input.is_action_pressed("move_up"):
		$AnimationPlayer.play("walk_forward")
	elif Input.is_action_just_released("move_up") and $AnimationPlayer.current_animation == "walk_forward":
		$AnimationPlayer.stop()
		$Sprite3D.frame = 10

	elif Input.is_action_pressed("move_down"):
		$AnimationPlayer.play("walk_backwards")
	elif Input.is_action_just_released("move_down") and $AnimationPlayer.current_animation == "walk_backwards":
		$AnimationPlayer.stop()
		$Sprite3D.frame = 0
		
	if Input.is_action_pressed("move_left") and  Input.is_action_pressed("move_right") or \
		Input.is_action_pressed("move_up") and  Input.is_action_pressed("move_down"):
		$AnimationPlayer.stop()
		$Sprite3D.frame = 0
	if Input.is_action_just_pressed("jump"):
		pass
