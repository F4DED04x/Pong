extends Control

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

@onready var sfx_button: Button = $VBoxContainer/SFXButton
@onready var timer: Timer = $Timer

var stage_selected

func _on_play_with_cpu_button_pressed() -> void:
	stage_selected = 0
	play_sfx_click()
	timer.start()

func _on_play_with_player_2_button_pressed() -> void:
	stage_selected = 1
	play_sfx_click()
	timer.start()

func _on_sfx_button_pressed() -> void:
	play_sfx_click()
	AudioManager.toggle_sfx()
	if AudioManager.is_sfx:
		sfx_button.text = "SFX: ON"
	else:
		sfx_button.text = "SFX: OFF"

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func play_sfx_click():
	AudioManager.play_sfx(audio_stream_player, AudioManager.CLICK)

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_packed(GameManager.STAGES[stage_selected])
