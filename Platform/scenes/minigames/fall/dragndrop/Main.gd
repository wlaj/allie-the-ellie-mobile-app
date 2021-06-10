extends Node2D


func _ready():
	pass


func _on_PauseMobile_pressed():
	get_tree().paused = true
	$PauseMobile/Popup.show()
