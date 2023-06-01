extends Sprite2D

var screen_size
@export var speed = 500
# Called when the node enters the scene tree for the first time.
func _ready():
	$explosion.hide()
	$explosion.animation = "default"
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2(cos(rotation-PI/2), sin(rotation-PI/2))

	position += velocity * delta * speed
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

	if position.x <= 0 || position.x >= screen_size.x:
		print("explosion")
		$explosion.show()
		$explosion.play()
		queue_destroy(1)
		
	elif position.y <= 0 || position.y >= screen_size.y:
		print("explosion")
		$explosion.show()
		$explosion.play()
		queue_destroy(1)
	
func queue_destroy(sec):
	await get_tree().create_timer(sec).timeout
	queue_free()
	
