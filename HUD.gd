extends CanvasLayer
signal score


# Called when the node enters the scene tree for the first time.
#func _ready():
#	show() # Replace with function body.

func update_score(score):
	$lifeP1.text = str(score)
	$lifeP2.text = str(score)
	$lifeP1.show()
	$lifeP2.show()
	$lifeP1.text = 10
	$lifeP2.text = 10
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
