extends Control

@onready var timer = $Timer
@onready var display_goal = $"."
@onready var player_1_2 = $"MarginContainer/VBoxContainer/Player 1_2"
@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer

func _ready():
	SignalManager.goal_player1.connect(_on_goal1)
	SignalManager.goal_player2.connect(_on_goal2)
	display_goal.visible = false

func _on_goal1():
	timer.start()
	AudioManager.play_sfx(audio_stream_player, AudioManager.SCORE)
	display_goal.visible = true
	#GameManager.goal_by = "Player 1"
	player_1_2.text = ("PLAYER 1!")

func _on_goal2():
	timer.start()
	AudioManager.play_sfx(audio_stream_player, AudioManager.SCORE)
	display_goal.visible = true
	#GameManager.goal_by = "Player 2"
	player_1_2.text = ("PLAYER 2!")

func _on_timer_timeout():
	SignalManager.goal_finished.emit()
