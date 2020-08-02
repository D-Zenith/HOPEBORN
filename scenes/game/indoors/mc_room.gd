extends Spatial
export var HintBarNode: NodePath

var HintBar
var proximity_item = ""
func _ready():
	HintBar = get_node(HintBarNode)

func _on_DoorArea_body_entered(body):
	if body.is_in_group("PLAYER"):
		HintBar.show_hint("Door: Press E to open.")
		proximity_item = "door"

func _on_DoorArea_body_exited(body):
	if body.is_in_group("PLAYER"):
		HintBar.reset()
		if proximity_item == "door":
			proximity_item = ""

func _input(event):
	if event.is_action_pressed("interact"):
		match proximity_item:
			"door":
				$WorldEnvironment/Door_Group/DoorFrame2/Door2/AnimationPlayer.play("open_door")
			"computer":
				$WorldEnvironment/Camera/CamAnimation.play("focus_computer")
				HintBar.show_hint("Computer: Press E to exit")
				proximity_item = "computer_screen"
			"computer_screen":
				$WorldEnvironment/Camera/CamAnimation.play_backwards("focus_computer")

func _on_DesktopArea_body_entered(body):
	if body.is_in_group("PLAYER"):
		HintBar.show_hint("Computer: Press E to use.")
		proximity_item = "computer"

func _on_DesktopArea_body_exited(body):
	if body.is_in_group("PLAYER"):
		HintBar.reset()
		if proximity_item == "computer":
			proximity_item = ""
