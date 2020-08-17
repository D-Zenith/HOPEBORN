extends KinematicBody

export var SPEED = 10
var dir = Vector3.ZERO
onready var particles=$particles

func _physics_process(delta):
	move_and_slide(dir * SPEED)
	

func _on_LifetimeTimer_timeout():
	queue_free()
	

# collison for player health decrease 
#can be implemented with area on player too
func _on_orb_body_entered(body):
	if "Player" in body.name:
		var field = get_parent().get_parent().get_parent()
		field.my_hp-=30
