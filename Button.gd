extends Button


func _on_StartButton_pressed():
	get_tree().change_scene("res://Level_InsideXZ.tscn")

func _on_TutorialButton_pressed():
	get_tree().change_scene("res://Tutorial.tscn")

func _on_BackButton_pressed():
	get_tree().change_scene("res://Start.tscn")
