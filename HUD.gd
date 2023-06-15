extends CanvasLayer

func _ready():
	$lifeP1.text = str("10")
	$lifeP2.text = str("10")
	
func on_hit():
	if $lifeP1.text == str("10"):
		$lifeP1.text = str("9")

func on_help():
	if $lifeP2.text == str("10"):
		$lifeP2.text = str("9")
	
	
# Called when the node enters the scene tree for the first time.
#func _ready():
#	show() # Replace with function body.

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$lifeP1.show()
	$lifeP2.show()
