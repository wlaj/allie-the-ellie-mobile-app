extends KinematicBody2D


var velocity = Vector2()
export var direction = -1

func _ready():
	if direction == 1:
		$Sprite.flip_h = true
	
	
func _physics_process(delta):
	
	position += Vector2(2,0)
	
	if is_on_wall():
		direction = direction * -1
		$Sprite.flip_h = not $Sprite.flip_h
		
	velocity.y += 20
	
	velocity.x = 50 * direction
