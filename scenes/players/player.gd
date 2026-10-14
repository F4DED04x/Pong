extends CharacterBody2D

@export var speed_first_player : float

@export var position_x_asigned: float

func _physics_process(_delta):
	inputs_process()
	move_and_slide()
	always_position_x()

func inputs_process():
	if GameManager.can_move == true:
		var y_input = Input.get_axis("UpFirstPlayer", "DownFirstPlayer")
		var y_direction = speed_first_player * y_input
		velocity.y = y_direction

func always_position_x():
	if position.x != position_x_asigned:
		position.x = position_x_asigned
