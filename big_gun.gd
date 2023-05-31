extends Node2D

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector. (0,0)
	self.look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("shoot"):
		velocity.x += 200 # (1,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
