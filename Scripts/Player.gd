extends CanvasLayer

signal command_selected(rps)

func _ready():
	reset()
	
func reset():
	$RockButton.hide()
	$ScissorsButton.hide()
	$PaperButton.hide()

func start():
	$RockButton.show()
	$ScissorsButton.show()
	$PaperButton.show()
	$RockButton.disabled = false
	$ScissorsButton.disabled = false
	$PaperButton.disabled = false	


func _on_RockButton_pressed():
	$ScissorsButton.hide()
	$PaperButton.hide()
	$RockButton.disabled = true
	emit_signal("command_selected", 0)


func _on_ScissorsButton_pressed():
	$RockButton.hide()
	$PaperButton.hide()
	$ScissorsButton.disabled = true
	emit_signal("command_selected", 1)
	

func _on_PaperButton_pressed():
	$RockButton.hide()
	$ScissorsButton.hide()
	$PaperButton.disabled = true

	emit_signal("command_selected", 2)
