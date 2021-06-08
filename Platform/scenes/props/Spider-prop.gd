extends KinematicBody2D

var velocity = Vector2()
export var direction = -1

func _ready():
	if direction == 1:
		$Sprite.flip_h = true
	
	
func _physics_process(delta):
	
	if is_on_wall():
		direction = direction * -1
		$Sprite.flip_h = not $Sprite.flip_h
		
	velocity.y += 20
	
	velocity.x = 50 * direction
	
	velocity =  move_and_slide(velocity,Vector2.UP)


func _on_TopChecker_body_shape_entered(body_id, body, body_shape, local_shape):
	$Sprite.play("squashed")
	

