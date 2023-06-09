extends CharacterBody2D

signal hit
signal shoot
var life = 10
var ammo = 1
@export var speed=300
var screen_size

func _newgame():
	pass
# Called when the node enters the scene tree for the first time.

func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(1440,540)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos
	pos = from_angle_to_vector(rotation) * 80
	var direction = Vector2(0,0) # The player's movement vector. (0,0)
	
	if Input.is_action_pressed("p2_right"):
		rotate(PI/50) # (1,0)
	elif Input.is_action_pressed("p2_left"):
		rotate(-PI/50)
	if Input.is_action_pressed("p2_down"):     
		direction = from_angle_to_vector(rotation - PI)
	if Input.is_action_pressed("p2_up"):
		direction = from_angle_to_vector(rotation)
	if Input.is_action_just_pressed("p2_shoot"):
		shoot.emit(pos + position, rotation)
		if ammo > 0:
			shoot_bullet()
	
	var move_to = direction * delta * speed
	move_and_collide(move_to)
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func from_angle_to_vector(radian: float):
	return Vector2(cos(radian), sin(radian))
	
func shoot_bullet():
	var pos = from_angle_to_vector(rotation) * 80
	ammo -= 1
	shoot.emit(pos + position, rotation)
	$reload.start()

func on_hit():
	print("help, i've been hit!")
	life -= 1
	$bullet.start()
	hit.emit(life)

func _on_restart_bullet_timeout():
	if ammo == 0:
		ammo += 1
