extends Node2D


func _ready():
	pass


func _on_EndHouseButton_pressed():
	get_tree().change_scene("res://scenes/small/Christmas-House-lvl.tscn")


func _on_SnowflakeButton_pressed():
	$Snow/CPUParticles2D.visible = true
