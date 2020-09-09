extends Control
onready var ProgramBarScene = load("res://nodes/ui/computer/ProgramBar.tscn")
onready var BlogScene = load("res://nodes/ui/computer/Blog.tscn")

var running_programs = []
var taskbar=[]
var ProgramBar
func _ready():
	pass


func _on_BlogButton_pressed():
	var Blog = BlogScene.instance()
	running_programs.append(Blog)
	$Screen/WindowContainer.add_child(Blog)
	Blog._index=running_programs.find(Blog)
	Blog.connect("minimized", self, "on_window_minimized", [Blog._index])
	Blog.connect("closed", self, "on_window_closed", [Blog._index])
	taskbar("add","blog",Blog._index)
#	print("blog and its index",Blog,Blog._index)
#	print("running programs",running_programs)
	
	
	
func _on_WikiButton_pressed():
	pass # Replace with function body.

func on_TaskBar_item_pressed(_index):
	$Screen/WindowContainer.get_child(_index).visible = !running_programs[_index]
	running_programs[_index] = !running_programs[_index]
#	print(_index)
#	print(running_programs)
#	print(taskbar)

func on_window_minimized(_index):
	running_programs[_index] = false

func on_window_closed(_index):
	running_programs[_index] = false
	running_programs.remove(_index)
	taskbar("close","blog",_index)

func taskbar(action,program_name,index):
	if action=="add":
		ProgramBar=ProgramBarScene.instance()
		taskbar.append(ProgramBar)
#		print("taskbar item",taskbar)
		ProgramBar.get_node("Label").text = program_name
		ProgramBar.get_node("Button").connect("pressed", self, "on_TaskBar_item_pressed", [index])
		$Screen/TaskBar/ProgramContainer.add_child(ProgramBar)
	elif action=="close":
#		print("close")
		$Screen/TaskBar/ProgramContainer.remove_child(taskbar[index])
		taskbar.remove(index)
		print(taskbar)
	
