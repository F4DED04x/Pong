extends CharacterBody2D

@export var speed_cpu : float
@export var speed_slowed : float
@export var vision_cpu : float
@export var position_x_asigned: float
var timeout_reaction : float = 0.4
var target_y : float

@onready var ball = get_tree().get_first_node_in_group("ball")

func _ready() -> void:
	target_y = position.y

func _physics_process(delta):
	always_position_x()
	if GameManager.can_move:
		follow_ball_y(ball, delta)
		move_and_slide()

func follow_ball_y(ball, delta):
	if ball == null:
		return
	
	target_y = ball.position.y
	if ball.position.x >= vision_cpu:
		position.y = move_toward(position.y, target_y, speed_cpu * delta)

func always_position_x():
	if position.x != position_x_asigned:
		position.x = position_x_asigned

func _on_area_2d_area_entered(_area: Area2D) -> void:
	speed_cpu = speed_slowed

func _on_area_2d_area_exited(_area: Area2D) -> void:
	speed_cpu = 340.0
