extends Control
onready var ProgramBarScene = load("res://nodes/ui/computer/ProgramBar.tscn")
onready var BlogScene = load("res://nodes/ui/computer/Blog.tscn")

var running_programs = []

func _ready():
	pass


func _on_BlogButton_pressed():
	var Blog = BlogScene.instance()
	running_programs.append(true)
	Blog._index = len(running_programs) - 1
	$Screen/WindowContainer.add_child(Blog)
	Blog.connect("minimized", self, "on_window_minimized", [Blog._index])
	Blog.connect("closed", self, "on_window_closed", [Blog._index])

	
	var ProgramBar = ProgramBarScene.instance()
	ProgramBar.get_node("Label").text = "Blog"
	ProgramBar.get_node("Button").connect("pressed", self, "on_TaskBar_item_pressed", [Blog._index])
	$Screen/TaskBar/ProgramContainer.add_child(ProgramBar)
	
func _on_WikiButton_pressed():
	pass # Replace with function body.

func on_TaskBar_item_pressed(_index):
	$Screen/WindowContainer.get_child(_index).visible = !running_programs[_index]
	running_programs[_index] = !running_programs[_index]

func on_window_minimized(_index):
	running_programs[_index] = false

func on_window_closed(_index):
	running_programs[_index] = false
