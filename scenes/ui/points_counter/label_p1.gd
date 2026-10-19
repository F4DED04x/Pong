extends Label

@onready var label = $"."

func _process(_delta):
	var points_p1 = GameManager.points_player1
	
	label.text = str("Player 1 : ", points_p1)
