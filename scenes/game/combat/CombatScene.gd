extends Control

onready var EnemyHP = $UI/EnemyHPBar
onready var MyHP = $UI/MyHPBar

onready var EnemyOrb = load("res://scenes/game/combat/EnemyOrb.tscn")

var my_turn = true
var escape_chance = 30 #%
var my_hp = 100
var enemy_hp = 100
var enemy_dmg = 20
var enemy_dodge = 10 #%
var attack_dmg = 20

func _process(delta):
	EnemyHP.value = enemy_hp
	MyHP.value = my_hp

func roll_dice(chance):
	randomize()
	var result = randi() % 101
	return (result <= chance)


func _on_AttackButton_pressed():
	var will_dodge = roll_dice(enemy_dodge)
	if will_dodge:
		("Your aim is S$!#!")
	else:
		enemy_hp -= attack_dmg
	
	consume_turn()
	
func _on_ItemButton_pressed():
	$UI/ItemsContainer.visible = !$UI/ItemsContainer.visible


func _on_ScanButton_pressed():
	pass # Replace with function body.


func _on_RunButton_pressed():
	randomize()
	var will_escape = randi() % 101
	if will_escape <= escape_chance:
		("You escaped successfully!")
	else:
		("You will die!")

func consume_turn():
	enemy_turn()


func enemy_turn():
	my_turn  = false
	var orb = EnemyOrb.instance()
	orb.dir = ($CombatField/Player.translation - $CombatField/Enemy.translation).normalized()
	$CombatField/Enemy.add_child(orb)
	
