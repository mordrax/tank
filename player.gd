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
		rotate(PI/50) # (1,0)
	elif Input.is_action_pressed("left"):
		rotate(-PI/50)
	if Input.is_action_pressed("down"):     
		direction = from_angle_to_vector(rotation-PI)
	if Input.is_action_pressed("up"):
		direction = from_angle_to_vector(rotation)
	if Input.is_action_just_pressed("shoot"):
		shoot.emit(pos + position, rotation)
	
	
	var move_to = direction * delta * speed
	move_and_collide(move_to)
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func from_angle_to_vector(radian: float):
	return Vector2(cos(radian), sin(radian))


#func _on_area_entered(area):
#	#life1 = int(10)
#	#life1 -= 1
#	$HUD/lifeP1.text == str(10)
#	show()
#	if $HUD/lifeP1.text == str(10):
#		$HUD/lifeP1.text = str(9)
#	show()
#	$restart_player.start()


func _on_restart_player_timeout():
	speed = 300


func _on_area_2d_area_entered(area):
	#life1 = int(10)
	#life1 -= 1
	$HUD/lifeP1.text == str(10)
	show()
	if $HUD/lifeP1.text == str(10):
		$HUD/lifeP1.text = str(9)
	show()
	$restart_player.start()
	
 # Replace with function body.
func on_hit():
	print("help, i've been hit!")
	$HUD/lifeP1.text == str(10)
	show()
	if $HUD/lifeP1.text == str(10):
		$HUD/lifeP1.text = str(9)
	show()
	$restart_player.start()



func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	#life1 = int(10)
	#life1 -= 1
	$HUD/lifeP1.text == str(10)
	show()
	if $HUD/lifeP1.text == str(10):
		$HUD/lifeP1.text = str(9)
	show()
	$restart_player.start()
	
 # Replace with function body.
 
