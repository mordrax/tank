extends Node2D

func _process(_delta):
	pass
	
	# The player's movement vector. (0,0)
	#self.look_at(get_global_mouse_position())
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	
func from_angle_to_vector(radian: float):
	return Vector2(cos(radian), sin(radian))

# Called every frame. 'delta' is the elapsed time since the previous frame.
