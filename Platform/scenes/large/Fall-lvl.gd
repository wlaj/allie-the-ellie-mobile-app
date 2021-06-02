extends Node2D


func _ready():
	MusicController.play_music()


func _on_InteractHouse_pressed():
	$AnimationPlayer.play("interaction")
