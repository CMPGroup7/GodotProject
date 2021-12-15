extends Node2D

var is_play = false

# play background music when game starts
func _ready():
	get_node("/root/BackgroundMusic/BackgroundMusic").play()

# change bgm when the game is over and show final scene
func changeFinish():
	get_node("/root/BackgroundMusic/BackgroundMusic").stop()
	get_node("/root/BackgroundMusic/FinalMusic").play()

# change bgm when player go back to start scene from the final scene
func goHome():
	get_node("/root/BackgroundMusic/FinalMusic").stop()
	get_node("/root/BackgroundMusic/BackgroundMusic").play()
