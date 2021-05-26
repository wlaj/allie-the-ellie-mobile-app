extends CanvasLayer

func _ready():
	set_visible(false)
	
func _input(event):
	
	if event.is_action_pressed("ui_accept"):
		set_visible(!get_tree().paused)
		get_tree().paused = !get_tree().paused
		


func _on_Button_pressed():
	get_tree().paused = false
	set_visible(false)
	
func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible
  


func _on_CheckButton_toggled(button_pressed):
	if(button_pressed):
		var master_sound = AudioServer.get_bus_index("Master")
		AudioServer.set_bus_mute(master_sound, true)
	else:
		var master_sound = AudioServer.get_bus_index("Master")
		AudioServer.set_bus_mute(master_sound, false) 


