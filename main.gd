extends Node2D

@export var ammo_scene: PackedScene
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_shoot(pos, rot):
	var bullet = ammo_scene.instantiate()
	bullet.position = pos
	bullet.rotation = rot + PI/2
	add_child(bullet)
