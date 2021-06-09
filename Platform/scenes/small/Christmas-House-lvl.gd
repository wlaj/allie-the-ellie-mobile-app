extends Node


func _ready():
	pass


func _on_WreathButton_pressed():
	print("Coin is collected")


func _on_Startingpoint_body_entered(body):
	get_tree().change_scene("res://scenes/large/Winter-lvl.tscn")


func _on_PauseMobile_pressed():
	get_tree().paused = true
	$PauseMobile/Popup.show()
