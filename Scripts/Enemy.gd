extends CanvasLayer

signal command_selected(rps)

func _ready():
	reset()
	
	
func reset():
	$AnimatedSprite.hide()
	
	
func start():
	$AnimatedSprite.show()
	$AnimatedSprite.play("roulette")


func stop():
	var rps = randi() % 3
	
	$AnimatedSprite.stop()
	$AnimatedSprite.frame = rps
	emit_signal("command_selected", rps)
