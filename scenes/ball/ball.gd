extends CharacterBody2D

@export var speed_ball: float
@export var max_speed_ball: float

@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer

var direction
var random_x
var random_y
var up_or_down

func _ready():
	#DECIDE si se lanzará INICIALMENTE a la DERECHA o a la IZQUIERDA
	random_x = randi_range(0, 1)
	if random_x == 0:
		random_x = -1
	#DECIDE si se lanzará INICIALMENTE ARRIBA O ABAJO
	up_or_down = randi_range(1,2)
	random_y = randf_range(0.6, 1.1)
	if up_or_down == 1:
		random_y = random_y * -1
	
	direction = Vector2(random_x, random_y).normalized()

func _physics_process(_delta):
	velocity.x = direction.x * speed_ball
	velocity.y = direction.y * speed_ball
	move_and_slide()
	bounce_ball()

func bounce_ball():
	#DETECTA COLISIONES con otros OBJETOS y OBTIENE al COLISIONADOR
	if get_slide_collision_count() > 0:
		var collision = get_slide_collision(0)
		var collider = collision.get_collider()
		
		#INVIERTE la NORMAL, haciendo REBOTAR a la PELOTA
		direction = direction.bounce(collision.get_normal())
		AudioManager.play_sfx(audio_stream_player, AudioManager.HIT)
		
		#AUMENTA la SPEED por PAREDES
		if collider.name == "TopWall" or collider.name == "BottomWall":
			speed_ball += 14
		#AUMENTA la SPEED por PLAYERS y CPU
		elif collider.name == "Player" or collider.name == "Player2" or collider.name == "CPU":
			direction = direction.rotated(randf_range(-0.08, 0.08))
			direction = direction.normalized()
			speed_ball += 34
