extends Control


func _input(event):
	if event.is_action_pressed("accept"):
		#warning-ignore:return_value_discarded
		Loader.goto_scene("res://scenes/game/menus/fileselect.tscn")
