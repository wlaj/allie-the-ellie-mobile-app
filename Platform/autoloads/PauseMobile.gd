extends CanvasLayer

export(PackedScene) var target_scene

func _ready():
	pass

func _input(event):
	
	if event.is_action_pressed("ui_accept"):
		get_tree().paused = true
		$Popup.show()

func _on_MuteButton_toggled(button_pressed):
	if(button_pressed):
		MusicController.stop_music()
	else:
		MusicController.play_music()


func _on_PlayButton_pressed():
	$Popup.hide()
	get_tree().paused = false


func _on_HomeButton_pressed():
	$Popup.hide()
	get_tree().paused = false
	get_tree().change_scene_to(target_scene)
	if !target_scene:
		print("no scene in this bitch")
		get_tree().reload_current_scene()
