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
