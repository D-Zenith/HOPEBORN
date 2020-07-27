extends Node2D

export var _continue : PackedScene
export var _new_game: PackedScene



func _on_quit_pressed():
	get_tree().quit()


func _on_continue_pressed():
	pass
	

func _on_new_pressed():
	Loader.goto_scene(_new_game.resource_path)
