extends Control

var once=false

func _input(event):
	if event.is_action_pressed("accept") and once==false:
		#warning-ignore:return_value_discarded
		Loader.goto_scene("res://scenes/game/menus/menuscreen.tscn")

