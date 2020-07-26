extends Spatial

export var next_scene : String

func _process(delta):
	if Input.is_action_just_pressed("accept"):
		$Fade.unload(next_scene)
