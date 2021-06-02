extends Area2D


func _ready():
	pass

func _physics_process(delta):
	position += Vector2(-2,0)

signal coin_collected

func _on_Coin_body_entered(body):
	$AnimationPlayer.play("bounce")
	print("Coin is collected")


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free() 
	emit_signal('coin_collected')
