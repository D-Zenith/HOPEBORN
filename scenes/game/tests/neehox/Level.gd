extends Spatial

export var next_scene : String

func _process(delta):
	if Input.is_action_just_pressed("accept"):
		$Fade/AnimationPlayer.play("Unload")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Unload":
		get_tree().change_scene(next_scene)
