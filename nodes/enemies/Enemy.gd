extends Sprite3D


func _on_Area_body_entered(body):
	if body.is_in_group("PLAYER"):
		Loader.goto_scene("res://scenes/game/combat/CombatScene.tscn")