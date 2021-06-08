extends Node

var battle_music = load("res://assets/music/music.ogg")

func _ready():
	pass

func play_music():
	$Music.stream = battle_music
	$Music.play()

func stop_music():
	$Music.stop()

