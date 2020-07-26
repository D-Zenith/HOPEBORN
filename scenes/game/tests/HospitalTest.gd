extends Control

func _on_door_body_entered(body):
	
	if "Player" in body.name:
		$Fade.unload()
		print("door opened")
