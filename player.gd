extends Area2D

signal hit
signal shoot

@export var speed=600
var screen_size

func _newgame():
	pass
# Called when the node enters the scene tree for the first time.

func _ready():
	screen_size = get_viewport_rect().size
	
	# Hello, this is a commit from Richie

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector. (0,0)
	if Input.is_action_pressed("right"):
		velocity.x += 1 # (1,0)
	elif Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_just_pressed("shoot"):
		shoot.emit(position, $body/big_gun.rotation)

	position += velocity * delta * 100
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	

