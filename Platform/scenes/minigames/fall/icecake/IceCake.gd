extends Node

var wormcake = preload('res://assets/props/cake/wormcake.png')

func _ready():
	pass

func _on_TextureButton2_pressed():
	$HBoxContainer/TextureRect.set_texture(wormcake)
