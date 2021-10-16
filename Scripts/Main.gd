extends Node2D

var player_rps = -1
var enemy_rps = -1
var score = 0

func _ready():
	pass

func play():
	$HUD.update_annouce("")
	$BGMPlayer.pitch_scale = 1 + score * 0.05
	$Player.start()
	$Enemy.start()

func start_game():
	score = 0
	play()
	$BGMPlayer.play()


func replay_game():
	play()
	

func reset_game():
	$Player.reset()
	$Enemy.reset()
	$HUD.reset()


func _on_Player_command_selected(rps):
	player_rps = rps
	$Enemy.stop()


func _on_Enemy_command_selected(rps):
	enemy_rps = rps
	show_result()


func show_result():
	var res = (3 + enemy_rps - player_rps) % 3

	if res == 1:
		# win
		$HUD.update_annouce("Win")
		score += 1
		$HUD.update_score(score)
	elif res == 2:
		# lose
		$HUD.update_annouce("Lose")
		$BGMPlayer.stop()
		yield(get_tree().create_timer(2), "timeout")
		reset_game()
		return
	else:
		# draw
		$HUD.update_annouce("Draw")
	
	yield(get_tree().create_timer(2), "timeout")
	replay_game()
	
	
