extends Area2D


func _on_Node2D_body_entered(body):
	print("A click!")
	$Sprite.play("activated")
