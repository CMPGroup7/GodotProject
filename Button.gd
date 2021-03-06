extends Button

#Store global variables as local variable
onready var player_vars = get_node("/root/GlobalVariables")

#Open first level scene
func _on_StartButton_pressed():
	get_tree().change_scene("res://Level_InsideXZ.tscn")

#Open Tutorial scene
func _on_TutorialButton_pressed():
	get_tree().change_scene("res://Tutorial.tscn")

#Go back from Tutorial scene to Start scene
func _on_BackButton_pressed():
	get_tree().change_scene("res://Start.tscn")

# initialize global values so that player can play game again
func _on_GoHome_pressed():
	player_vars.life = 3
	player_vars.collected = 0
	player_vars.cur_door = null
	player_vars.cur_cam = null
	player_vars.jjokji1 = true
	player_vars.jjokji2 = true
	player_vars.jjokji3 = true
	player_vars.jjokji4 = true
	player_vars.jjokji5 = true
	player_vars.jjokji6 = true
	player_vars.jjokji7 = true
	player_vars.finish_timing = false
	
	get_node("/root/BackgroundMusic").goHome()
	
	get_tree().change_scene("res://Start.tscn")
