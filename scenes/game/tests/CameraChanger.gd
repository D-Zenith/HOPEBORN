extends Area

func _on_Spatial_body_entered(body):
	if body.is_in_group("PLAYER"):
		$Camera.current = true
