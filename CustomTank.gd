extends Sprite2D

signal hit

@export var speed=400

var screen_size


 

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()
	# Hello, this is a commit from Richie


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector. (0,0)
	if Input.is_action_pressed("right"):
		velocity.x += 1 # (1,0)
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("up"):
		velocity.y += 1
	if Input.is_action_pressed("down"):
		velocity.y -= 1

			
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)	

func start(pos):
	position = pos
	pos Vector2.(pos.x,pos.y)
	show()
	

