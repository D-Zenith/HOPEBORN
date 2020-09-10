extends RigidBody2D
export var speed = 450

func _ready():
	linear_velocity.y = speed

func _on_Hitbox_body_entered(body):
	if body.name == "PlayerBody":
		get_node("/root/CombatScene").my_hp -= 10
		get_node("/root/CombatScene/UI/MinigamePopup/Bg/HitRect/HitAnim").play("hit")
