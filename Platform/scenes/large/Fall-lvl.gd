extends Node

func _ready():
	MusicController.play_music()

func _enter_tree():
	if Checkpoint.last_position:
		$Allie.global_position = Checkpoint.last_position


func _on_InteractHouse_pressed():
	$AnimationPlayer.play("interaction")


func _on_CaveEntrance_body_shape_entered(body_id, body, body_shape, local_shape):
	pass # Replace with function body.

func _on_BedroomButton_pressed():
	get_tree().change_scene("res://scenes/small/House-allie.tscn")


func _on_BakinghouseButton_pressed():
	get_tree().change_scene("res://scenes/small/House-fall.tscn")


func _on_CaveEntrance_body_entered(body):
	get_tree().change_scene("res://scenes/small/Cave-lvl.tscn")



func _on_PauseMobile_pressed():
	get_tree().paused = true
	$PauseMobile/Popup.show()


func _on_Leavesbush_body_entered(body):
	Input.vibrate_handheld(500)

func _on_OwlTree_body_shape_entered(body_id, body, body_shape, local_shape):
	$FrontProps/OwlTree/SoundOehoe.play()


func _on_BirdHouse_body_shape_entered(body_id, body, body_shape, local_shape):
	$FrontProps/BirdHouse/SoundPiep.play()


func _on_SnowflakeButton_pressed():
	$Rain/CPUParticles2D.visible = true


func _on_ToiletHouseButton_pressed():
	get_tree().change_scene("res://scenes/small/Toilet-House.tscn")


func _on_ReindeerButton_pressed():
	$FrontProps/FirstHill/AnimationPlayer.play("ReindeerIn")
