extends Node2D


func _ready():
	pass


func _on_PauseMobile_pressed():
	get_tree().paused = true
	$PauseMobile/Popup.show()


func _on_ChocolateButton_pressed():
	get_tree().change_scene("res://scenes/minigames/fall/icecake/IceCake.tscn")
