extends Timer
onready var Cam = get_parent()

export var  speed = 0.5
export var switch_dir_time = 0.5
var target_v_offset = 0
var dir = 1
var rot_dir = -1
var target_rot = 0

func _process(delta):
	target_v_offset = rand_range(0, speed) * dir
	target_rot = rand_range(0,5) * rot_dir
	Cam.v_offset = lerp(Cam.v_offset, target_v_offset,delta)
	Cam.rotation_degrees.x = lerp(Cam.rotation_degrees.x, target_rot, delta)
func _ready():
	wait_time = switch_dir_time
	start()

func _on_ShakeTimer_timeout():
	dir *= -1
	rot_dir *= -1
