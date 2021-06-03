extends KinematicBody2D


func _ready():
	pass

func _physics_process(delta):
	position += Vector2(0.7,0)

func _on_TouchScreenButton_pressed():
	get_tree().change_scene("res://scenes/minigames/flyingallie/Flyingallie.tscn")
