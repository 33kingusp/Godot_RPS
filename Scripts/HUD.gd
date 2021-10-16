extends CanvasLayer

signal pressed_start()


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.hide()
	reset()
	
func reset():
	update_score(0)
	update_annouce("Rock Paper Scissors")
	yield(get_tree().create_timer(1), "timeout")
	$Button.show()


func update_annouce(text:String):
	$Announce.text = text

func update_score(point:int):
	$Score.text = str(point)

func _on_Button_pressed():
	emit_signal("pressed_start")
	$Button.hide()
	update_annouce("")
