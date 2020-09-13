extends Node
var encounter_scene
var encounter_position 
var coming_from_encounter

func set_location(location):
	encounter_position=location
func set_scene(scene):
	encounter_scene=scene

func get_scene():
	return encounter_scene

func get_location():
	return encounter_position

