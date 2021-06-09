extends Node2D


func _ready():
	pass


func _on_EndHouseButton_pressed():
	get_tree().change_scene("res://scenes/small/Christmas-House-lvl.tscn")


func _on_SnowflakeButton_pressed():
	$Snow/CPUParticles2D.visible = true


func _on_PauseMobile_pressed():
	get_tree().paused = true
	$PauseMobile/Popup.show()


func _on_BunnyButton_pressed():
	$Props/Bunny/AnimationPlayer.play("BunnyHop")


func _on_IgloButton_pressed():
	$BackProps/Iglo/AnimationPlayer.play("ReindeerUp")
