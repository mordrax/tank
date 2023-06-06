extends Node2D

@export var bullet_scene: PackedScene
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_player_shoot(pos, rot):
	var bullet = bullet_scene.instantiate()
	bullet.position = pos
	bullet.rotation = rot
#	bullet.apply_force( from_angle_to_vector(rot+PI/2) * 100, pos)
	bullet.apply_force( from_angle_to_vector(bullet.rotation) * 20000, Vector2(0,0))
	add_child(bullet)

func from_angle_to_vector(radian: float):
	return Vector2(cos(radian), sin(radian))

	
