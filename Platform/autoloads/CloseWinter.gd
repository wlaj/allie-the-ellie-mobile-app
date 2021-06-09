extends CanvasLayer

export(PackedScene) var target_scene

func _ready():
	pass


func _on_TextureButton_pressed():
	get_tree().change_scene_to(target_scene)
	if !target_scene:
		print("no scene available")
		get_tree().change_scene("res://scenes/large/Winter-lvl.tscn")
