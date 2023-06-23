extends Node2D
@export var bullet_scene: PackedScene
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	$MusicBackground.play(10)
	screen_size = get_viewport_rect().size
	$HUD/label.hide()
	$HUD/label2.hide()
	$wall/StaticBody2D22.position = Vector2(1250,100)
	$wall/StaticBody2D23.position = Vector2(640,100)
	$wall/StaticBody2D24.position = Vector2(1420,-15)
	$wall/StaticBody2D25.position = Vector2(485,210)
	var rng = RandomNumberGenerator.new()
	var my_random_number = rng.randf_range(1, 2)
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

func _on_player_hit(life):
	$HUD/lifeP1.set_text(str(life))
	if life == (0):
		$HUD/label2.show()
		hide()
		$HUD/lifeP1.hide()
		$HUD/lifeP2.hide()

func _on_player_2_hit(life):
	$HUD/lifeP2.set_text(str(life))
	if life == 0:
		$HUD/label.show()
		hide()
		$HUD/lifeP1.hide()
		$HUD/lifeP2.hide()
	

func on_player_no():
	pass
	
