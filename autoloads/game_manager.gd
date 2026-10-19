extends Node

var can_move

var points_player1: int
var points_player2: int

var goal_by: String

const STAGES = {
	0: preload("res://scenes/enviroments/level_with_cpu.tscn"),
	1: preload("res://scenes/enviroments/level_with_player2.tscn")
}

func _ready():
	SignalManager.goal_player1.connect(on_goal_by_p1)
	SignalManager.goal_player2.connect(on_goal_by_p2)
	SignalManager.goal_finished.connect(on_goal_finished)
	can_move = true
	
	points_player1 = 0
	points_player2 = 0

func on_goal_by_p1():
	can_move = false
	GameManager.points_player1 += 1

func on_goal_by_p2():
	can_move = false
	GameManager.points_player2 += 1

func on_goal_finished():
	get_tree().reload_current_scene()
	can_move = true
