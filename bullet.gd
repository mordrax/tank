extends RigidBody2D

var screen_size
@export var speed = 500
# Called when the node enters the scene tree for the first time.
func _ready():	
	$explosion.hide()
	$explosion.animation = "default"
	screen_size = get_viewport_rect().size
	if _on_wall_area_entered():
		print("explosion")
		$explosion.show()
		$explosion.play()
		queue_destroy(1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2(0,0) 
	var velocity = from_angle_to_vector(rotation-PI/2)
	var area
#	position += velocity * delta * speed
#	position.x = clamp(position.x, 0, screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)
##
#	if _on_wall_area_entered():
#		print("explosion")
#		$explosion.show()
#		$explosion.play()
#		queue_destroy(1)

	

func queue_destroy(sec):
	await get_tree().create_timer(sec).timeout
	queue_free()

func from_angle_to_vector(radian: float):
	return Vector2(cos(radian), sin(radian))


#func _on_body_entered():
#	emit_signal("hit")



	# Replace with function body.


func _on_wall_area_entered():
	emit_signal("hit") # Replace with function body.
