extends KinematicBody

export var speed = 5
var acceleration = 10
export var gravity = 0.65
export var jump = 4

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3() 
var vvel = Vector3()
var inertia
var prev_pos

var y=0
var inair

func _ready():
	prev_pos = global_transform.origin
	
	print("coming_from_combat, (in player script)",GlobalLocation.coming_from_encounter)
	if GlobalLocation.coming_from_encounter:
		translation=GlobalLocation.get_location()
		
func _input(event):
	pass
		
func _physics_process(delta):		
	direction = Vector3()
	
	if Input.is_action_pressed("move_up"):
		direction -= transform.basis.z
	
	elif Input.is_action_pressed("move_down"):
		direction += transform.basis.z
		
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x
		
	elif Input.is_action_pressed("move_right"):
		direction += transform.basis.x
		
	inertia = (prev_pos - global_transform.origin).length() * speed 
	direction = direction.normalized() * speed
	direction += direction * (1.5 - inertia)
	direction.y = vvel.y 
	
	if not is_on_floor():
		vvel.y -= gravity
	else:
		vvel.y = -0.1
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vvel.y = jump
		move_and_slide(vvel, Vector3.UP)
	
	prev_pos = global_transform.origin
	
#	move_and_slide_with_snap(direction, Vector3.DOWN, Vector3.UP, true, 7, 0.8) 
	move_and_slide(direction, Vector3.UP)
		
	get_input_for_anim()
	
func gravity():
	return gravity

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

func _on_player_area_entered(area):
	print(area.name)
	if area.name == "safe_area_enemy":
		print("saving_player_location",translation)
		GlobalLocation.set_location(translation)
