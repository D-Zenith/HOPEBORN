extends Control



func _on_Area_body_entered(body):
	if body.is_in_group("PLAYER"):
		$GameWorld/Room/Camera2.current = true

func _on_Area2_body_entered(body):
	if body.is_in_group("PLAYER"):
		$GameWorld/Room/Camera.current = true
