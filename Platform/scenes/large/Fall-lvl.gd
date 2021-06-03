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
