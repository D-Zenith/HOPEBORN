extends Control

var dialog = [
	"I'm tired...",
	"I... don't know how to feel.",
	"I feel-",
	"Empty..."
]

var dialog_index = 0
var finished = false

func _ready():
	load_dialog()

func _process(delta):
	$"enter_indicator".visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$Text.bbcode_text = dialog[dialog_index]
		$Text.percent_visible = 0
		$Tween.interpolate_property(
			$Text, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
	dialog_index += 1


func _on_Tween_tween_completed(object, key):
	finished = true
