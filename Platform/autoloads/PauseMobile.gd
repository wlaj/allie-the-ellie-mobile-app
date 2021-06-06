extends CanvasLayer


func _ready():
	pass

func _input(event):
	
	if event.is_action_pressed("ui_accept"):
		get_tree().paused = true
		$Popup.show()

func _on_MuteButton_toggled(button_pressed):
	if(button_pressed):
		var master_sound = AudioServer.get_bus_index("Master")
		AudioServer.set_bus_mute(master_sound, true)
	else:
		var master_sound = AudioServer.get_bus_index("Master")
		AudioServer.set_bus_mute(master_sound, false) 


func _on_PlayButton_pressed():
	$Popup.hide()
	get_tree().paused = false


func _on_HomeButton_pressed():
	$Popup.hide()
	get_tree().paused = false
	get_tree().reload_current_scene()
