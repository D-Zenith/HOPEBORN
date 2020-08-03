extends Spatial
export var HintBarNode: NodePath


var HintBar


# state variable
var door_open=false
var lights_on=false
# state variable end

# utility variable
var proximity_item = ""
#utility variable end

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
				if door_open:
					$room_anims.play_backwards("open_door")
					door_open=false
				else:
					door_open=true
					$room_anims.play("open_door")
			"computer":
				$WorldEnvironment/Camera/CamAnimation.play("focus_computer")
				HintBar.show_hint("Computer: Press E to exit")
				proximity_item = "computer_screen"
			"computer_screen":
				$WorldEnvironment/Camera/CamAnimation.play_backwards("focus_computer")
			"lights":
				if lights_on:
					$room_anims.play("lights_off")
					lights_on=false
				else:
					$room_anims.play("lights_on")
					lights_on=true
func _on_DesktopArea_body_entered(body):
	if body.is_in_group("PLAYER"):
		HintBar.show_hint("Computer: Press E to use.")
		proximity_item = "computer"

func _on_DesktopArea_body_exited(body):
	if body.is_in_group("PLAYER"):
		HintBar.reset()
		if proximity_item == "computer":
			proximity_item = ""





func _on_switch_board_body_entered(body):
	if body.is_in_group("PLAYER"):
		HintBar.show_hint("Lights: Press E to use.")
		proximity_item = "lights"


func _on_exit_body_entered(body):
	if body.name=="Player":
		Loader.goto_scene("res://scenes/game/map/area1.tscn")
