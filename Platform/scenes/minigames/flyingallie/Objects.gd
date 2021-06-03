extends Node2D


func _ready():
	pass

func _physics_process(delta):
	position += Vector2(-2,0)




func _on_Fallzone_body_shape_entered(body_id, body, body_shape, local_shape):
	get_tree().reload_current_scene()
