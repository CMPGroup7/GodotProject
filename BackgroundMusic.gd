extends Node2D

func _ready():
	get_node("/root/BackgroundMusic/BackgroundMusic").play()
	
func changeFinish():
	get_node("/root/BackgroundMusic/BackgroundMusic").stop()
	get_node("/root/BackgroundMusic/FinalMusic").play()
