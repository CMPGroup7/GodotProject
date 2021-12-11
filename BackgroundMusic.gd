extends Node2D

var is_play = false

func _ready():
	get_node("/root/BackgroundMusic/BackgroundMusic").play()


func changeFinish():
	get_node("/root/BackgroundMusic/BackgroundMusic").stop()
	get_node("/root/BackgroundMusic/FinalMusic").play()

func goHome():
	get_node("/root/BackgroundMusic/FinalMusic").stop()
	get_node("/root/BackgroundMusic/BackgroundMusic").play()
