extends Control

onready var menu=$igm
onready var popup=menu.get_popup()

func _ready():
	
	popup.connect("id_pressed",self,"item_pressed")
func item_pressed(id):
	if id==0:
		save_game()
	if id==1:
		quit()

func save_game():
	print("game_saved")
	#will put the concerned save function here linked to the game save and load script which will be global
	pass
func quit():
	save_game()
	Loader.goto_scene("res://scenes/game/menus/fileselect.tscn")
	
