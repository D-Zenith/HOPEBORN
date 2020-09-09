extends Control

onready var EnemyHP = $UI/EnemyHPBar
onready var MyHP = $UI/MyHPBar
onready var MinigamePopup = $UI/MinigamePopup
onready var EnemyOrb = load("res://scenes/game/combat/EnemyOrb.tscn")
onready var MinigameOrb = load("res://nodes/enemies/MinigameOrb.tscn")
var my_turn = true
var escape_chance = 30 #%
var my_hp = 100
var enemy_hp = 100
var enemy_dmg = 20
var enemy_dodge = 10 #%
var attack_dmg = 20

var scan_line = "H"
var tween_limits = [0,300]
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
	$UI/ScangamePopup.show()


func _on_ScangamePopup_visibility_changed():
	if $UI/ScangamePopup.visible:
		$UI/ScangamePopup/Bg/ScanCrosshair.position = Vector2(rand_range(0,300), rand_range(0,300))
		$UI/ScangamePopup/Bg/ScanCrosshair.show()
		scan_line = "H"
		$UI/ScangamePopup/Bg/LineH.show()
		start_scanning()

func start_scanning():
	var dir = "y" if scan_line == "H" else "x"
	$UI/ScangamePopup/Bg/ScanTween.interpolate_property($UI/ScangamePopup/Bg.get_node("Line" + scan_line),"position:" + dir,tween_limits[0],tween_limits[1],2)
	$UI/ScangamePopup/Bg/ScanTween.start()
	

func _on_ScanTween_tween_completed(object, key):
	tween_limits.invert()
	start_scanning()

func _on_ScanStopButton_button_down():
	if scan_line == "H":
		$UI/ScangamePopup/Bg/ScanTween.stop_all()
		scan_line = "V"
		$UI/ScangamePopup/Bg/LineV.show()
		start_scanning()
	else:
		$UI/ScangamePopup/Bg/ScanTween.stop_all()
		# check for player accuracy
		var target = $UI/ScangamePopup/Bg/ScanCrosshair.position
		if abs(target.x - $UI/ScangamePopup/Bg/LineV.position.x) < 32 and \
		abs(target.y - $UI/ScangamePopup/Bg/LineH.position.y):
			#scan successful
			$UI/ScangamePopup/Bg/HitRect/ScanAnim.play("scanned")
		else:
			$UI/ScangamePopup/Bg/HitRect/ScanAnim.play("failed")
		

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
#	my_turn  = false
#	var orb = EnemyOrb.instance()
#	var dir = ($CombatField/Player.translation - $CombatField/Enemy.translation).normalized()
#	# to prevent attack from falling
#	dir.y=0
#	orb.dir=dir
#	$CombatField/Enemy.add_child(orb)
	MinigamePopup.show()
	for i in range(5):
		var _orb = MinigameOrb.instance()
		_orb.position.x = [50,150,250][randi() % 3] 
		$UI/MinigamePopup/Bg/OrbContainer.add_child(_orb)
		yield(get_tree().create_timer(0.7), "timeout")
	yield(get_tree().create_timer(1), "timeout")
	MinigamePopup.hide()

func _input(event):
	if MinigamePopup.visible:
		if event.is_action_pressed("move_left"):
			var pos = $UI/MinigamePopup/Bg/Player.position.x
			$UI/MinigamePopup/Bg/Player.position.x = max(pos - 100, 50)
		if event.is_action_pressed("move_right"):
			var pos = $UI/MinigamePopup/Bg/Player.position.x
			$UI/MinigamePopup/Bg/Player.position.x = min(pos + 100, 250)
			



