extends Node2D

export var scene : PackedScene

func _on_Button_pressed():
	Loader.goto_scene(scene.resource_path)
