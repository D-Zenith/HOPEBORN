extends Camera
onready var ShakeTimer = get_child(0)

export var  speed = 0.05
export var switch_dir_time = 0.6
export var rotate = false
export var rotate_strength = 1.0

var target_v_offset = 0
var dir = 1
var rot_dir = -1
var target_rot_x = 0
var target_rot_z = 0

func _process(delta):
	
	target_v_offset = rand_range(0, speed) * dir
	target_rot_x = rand_range(0,2) * rot_dir * rotate_strength
	target_rot_z = rand_range(0,2) * rot_dir * rotate_strength
	
	v_offset = lerp(v_offset, target_v_offset,delta)
	
	if rotate:
		rotation_degrees.x = lerp(rotation_degrees.x, target_rot_x, delta)
	#	rotation_degrees.z = lerp(rotation_degrees.z, target_rot_z, delta)
	
func _ready():
	ShakeTimer.wait_time = switch_dir_time
	ShakeTimer.start()

func _on_ShakeTimer_timeout():
	dir *= -1
	rot_dir *= -1
