extends CharacterBody2D

signal hit
signal shoot
var life = 10
@export var speed = 300
var screen_size

func _newgame():
	pass
# Called when the node enters the scene tree for the first time.

func _ready():
	screen_size = get_viewport_rect().size
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var watch_position = position
	var pos
	pos = from_angle_to_vector(rotation) * 80
	var direction = Vector2(0,0) # The player's movement vector. (0,0)
	
	if Input.is_action_pressed("right"):
		rotate(PI/75) # (1,0)
	elif Input.is_action_pressed("left"):
		rotate(-PI/75)
	if Input.is_action_pressed("down"):     
		direction = from_angle_to_vector(rotation-PI)
	if Input.is_action_pressed("up"):
		direction = from_angle_to_vector(rotation)
	if Input.is_action_just_pressed("shoot"):
		shoot.emit(pos + position, rotation)
	
	var move_to = direction# * delta * speed
	move_and_collide(move_to)


func from_angle_to_vector(radian: float):
	return Vector2(cos(radian), sin(radian))


func _on_area_entered(area):
	life -= 1
	speed = 50
	$restart_player.start()


func _on_restart_player_timeout():
	speed = 300
