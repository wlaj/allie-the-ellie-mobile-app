extends Node


func _ready():
	pass


func _on_TextureButton_toggled(button_pressed):
	if(button_pressed):
		Pause.set_visible(!get_tree().paused)
		Pause.get_tree().paused = !get_tree().paused
	else:
		Pause.get_tree().paused = false
		Pause.set_visible(false)
