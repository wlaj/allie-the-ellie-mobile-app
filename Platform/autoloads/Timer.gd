extends Control

var DisplayValue = 0

onready var timer = get_node("Timer")

func _ready():
	timer.set_wait_time(2)
	timer.start()


func _on_Timer_timeout():
	DisplayValue += 1
