extends Label

@onready var label = $"."

func _process(delta):
	var points_p2 = GameManager.points_player2
	
	label.text = str("Player 2: ", points_p2)
