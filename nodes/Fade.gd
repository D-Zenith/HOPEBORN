extends ColorRect
export var next_scene: String

func _ready():
	visible = true

func unload():
	print("animation played")
	$AnimationPlayer.play("Unload")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Unload":
		print("animation finished")
		get_tree().change_scene(next_scene)
