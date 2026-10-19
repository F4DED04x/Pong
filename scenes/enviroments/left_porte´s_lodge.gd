extends Area2D

func _on_area_entered(_area):
	SignalManager.goal_player2.emit()
