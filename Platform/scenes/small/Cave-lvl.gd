extends Node2D


func _ready():
	pass


func _on_StartingpointCave_body_entered(body):
	get_tree().change_scene("res://scenes/large/Winter-lvl.tscn")


func _on_EndpointCave_body_entered(body):
	get_tree().change_scene("res://scenes/large/Fall-lvl.tscn")
