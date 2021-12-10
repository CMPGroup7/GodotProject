extends AudioStreamPlayer2D

func _ready():
	get_node("/root/BackgroundMusic").play()
