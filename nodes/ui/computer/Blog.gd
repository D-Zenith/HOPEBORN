extends ColorRect
signal minimized
signal closed
var _index
func _ready():
	pass


func _on_MinButton_pressed():
	hide()
	emit_signal("minimized")


func _on_CloseButton_pressed():
	queue_free()
	emit_signal("closed")
