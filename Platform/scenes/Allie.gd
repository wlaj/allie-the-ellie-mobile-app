extends KinematicBody2D

var velocity = Vector2(0,0)
var coins = 0
const SPEED = 250
const GRAVITY = 35
const JUMPFORCE = -900

func _physics_process(delta):
	
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$AnimationPlayer.play("Walk")
		$Spritesheet.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$AnimationPlayer.play("Walk")
		$Spritesheet.flip_h = true
	else:
		pass
#		$AnimationPlayer.play("Walk")
	if not is_on_floor():
		$AnimationPlayer.play("Walk")
	
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
		$SoundWalk.play()
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
	


func _on_Fallzone_body_entered(body):
	get_tree().change_scene("res://scenes/large/Fall-lvl.tscn")

func _on_Starthouse_body_entered(body):
	get_tree().change_scene("res://scenes/small/Cave-lvl.tscn")

func _on_Cave_body_entered():
	get_tree().change_scene("res://scenes/small/Cave-lvl.tscn")


func _on_Startingpoint_body_shape_entered(body_id, body, body_shape, local_shape):
	get_tree().change_scene("res://scenes/large/Winter-lvl.tscn")


func _on_Endpoint_body_shape_entered(body_id, body, body_shape, local_shape):
	get_tree().change_scene("res://scenes/large/Fall-lvl.tscn")
