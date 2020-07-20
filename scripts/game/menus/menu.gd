extends Control

var next_scene = preload("res://scenes/game/menus/fileselect.tscn")

func _input(event):
	if event.is_action_pressed("accept"):
		#warning-ignore:return_value_discarded
		get_tree().change_scene_to(next_scene)
