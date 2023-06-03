extends Area2D

signal hit
signal shoot

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
	pos = from_angle_to_vector(rotation - PI/2) * 80
	var direction = Vector2(0,0) # The player's movement vector. (0,0)
	
	if Input.is_action_pressed("Right"):
		rotate(PI/75) # (1,0)
	elif Input.is_action_pressed("Left"):
		rotate(-PI/75)
	if Input.is_action_pressed("Down"):     
		direction = from_angle_to_vector(rotation + PI/2)
	if Input.is_action_pressed("Up"):
		direction = from_angle_to_vector(rotation - PI/2)
	if Input.is_action_just_pressed("Shoot"):
		shoot.emit(pos + position, rotation - PI/2)
	
	
	
	
	position += direction * delta * speed
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func from_angle_to_vector(radian: float):
	return Vector2(cos(radian), sin(radian))
