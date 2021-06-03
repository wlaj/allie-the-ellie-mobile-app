extends KinematicBody2D


const UP = Vector2(0,-1)
const ENGINE = 300
const MAXFALLSPEED = 200
const GRAVITY = 10

var motion = Vector2()

func _ready():
	pass
	
func _physics_process(delta):
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_just_pressed("jump"):
		motion.y = -ENGINE

	motion = move_and_slide(motion, UP)

