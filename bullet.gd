extends RigidBody2D

var screen_size
@export var speed = 500
signal hit
# Called when the node enters the scene tree for the first time.
func _ready():
	$explosion.hide()
	$explosion.animation = "default"
	screen_size = get_viewport_rect().size
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2(0,0) 
	var velocity = from_angle_to_vector(rotation-PI)
	
	position += velocity * delta * speed
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)


func queue_destroy(sec):
	await get_tree().create_timer(sec).timeout
	queue_free()

func from_angle_to_vector(radian: float):
	return Vector2(cos(radian), sin(radian))


func _on_body_entered():
	emit_signal("hit")
	


	# Replace with function body.


func _on_wall_area_entered():
	print("explosion")
	$explosion.show()
	$explosion.play()
	queue_destroy(1)


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	hit.emit()
	body.on_hit()
#	body.on_help()
	var zero_vector2 = Vector2(0,0)
	set_linear_velocity(zero_vector2)
	print("_on_body_shape_entered")
	$explosion.show()
	$explosion.play()
	queue_destroy(1) 
	#life1 = int(10)
	#life1 -= 1
	
	
	
	

	# Replace with function body.
	
	
