extends Node

const CLICK = preload("uid://dbqqb7opnknq2")
const HIT = preload("uid://djq626f8mckxb")
const SCORE = preload("uid://0y1vxihdbmx")

var is_sfx = true

func play_sfx(audio_stream_player, sfx):
	if is_sfx:
		audio_stream_player.stream = sfx
		audio_stream_player.play()

func toggle_sfx():
	is_sfx = not is_sfx
