extends Control

onready var EnemyHP = $UI/EnemyHPBar
onready var MyHP = $UI/MyHPBar

onready var EnemyOrb = load("res://scenes/game/tests/EnemyOrb.tscn")

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
		OS.alert("Your aim is S$!#!")
	else:
		enemy_hp -= attack_dmg
	
	enemy_turn()
	
func _on_ItemButton_pressed():
	pass # Replace with function body.


func _on_ScanButton_pressed():
	pass # Replace with function body.


func _on_RunButton_pressed():
	randomize()
	var will_escape = randi() % 101
	if will_escape <= escape_chance:
		OS.alert("You escaped successfully!")
	else:
		OS.alert("You will die!")

func enemy_turn():
	var orb = EnemyOrb.instance()
	$CombatField/Enemy.add_child(orb)
	
