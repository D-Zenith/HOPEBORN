extends Spatial


onready var speed =$Player.speed
func _ready():
	speed=2000


func _on_south_exit_body_entered(body):
	if "Player" in body.name:
		$Fade.unload()
