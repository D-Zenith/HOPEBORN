extends KinematicBody

export var SPEED = 10
var dir = Vector2.ZERO

func _physics_process(delta):
	move_and_slide(dir * SPEED)


func _on_LifetimeTimer_timeout():
	queue_free()
	
