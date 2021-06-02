extends Node2D


func _ready():
	MusicController.play_music()

func _enter_tree():
	if Checkpoint.last_position:
		$Allie.global_position = Checkpoint.last_position


func _on_InteractHouse_pressed():
	$AnimationPlayer.play("interaction")
