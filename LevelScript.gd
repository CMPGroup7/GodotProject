extends Node2D

onready var player_vars = get_node("/root/GlobalVariables")

const Transition = preload("res://TransitionScene.tscn")

func _ready():
	print(GlobalVariables.cur_door)

	if(GlobalVariables.cur_door):
		var door_node = find_node(GlobalVariables.cur_door)
		if door_node:
			$PlayerNode.global_position = door_node.global_position
			$PlayerNode.restart_pos = door_node.global_position

func _process(delta):
	
		if player_vars.jjokji1 == false and player_vars.jjokji2 == false and player_vars.jjokji3 == false and player_vars.jjokji4 == false and player_vars.jjokji5 == false and player_vars.jjokji6 == false and player_vars.jjokji7 == false:
			if player_vars.finish_timing == false:
				self.add_child(Transition.instance())
				$TransitionScene.transition()
				player_vars.finish_timing = true
				#get_tree().change_scene("res://FinalScene.tscn")
			

#func _on_TransitionScene_transitioned():
#	get_tree().change_scene("res://FinalScene.tscn")
