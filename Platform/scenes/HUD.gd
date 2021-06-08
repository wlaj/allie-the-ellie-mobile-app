extends CanvasLayer

var coins  = 0

func _ready():
	$Counter.text = String(coins)

func _on_coin_collected():
	 coins = coins + 1 
	 _ready()
	 if coins == 6:
		 get_tree().change_scene("res://scenes/large/Fall-lvl.tscn")
