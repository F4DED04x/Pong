extends Area2D

func _on_area_entered(area):
	SignalManager.goal_player1.emit()
