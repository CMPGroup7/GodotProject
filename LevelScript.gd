extends Node2D

onready var player_vars = get_node("/root/GlobalVariables")

const Transition = preload("res://TransitionScene.tscn")

func _ready():
#print(GlobalVariables.cur_door)
#Checks if a door has been picked upon loading level
	if(GlobalVariables.cur_door): #If not null
		var door_node = find_node(GlobalVariables.cur_door) #Look for it
		if door_node: #Double-check
			$PlayerNode.global_position = door_node.global_position #Set player position
			$PlayerNode.restart_pos = door_node.global_position #And restart position

func _process(delta):
		# fade out the game screen when player collect all the collectables.
		if player_vars.jjokji1 == false and player_vars.jjokji2 == false and player_vars.jjokji3 == false and player_vars.jjokji4 == false and player_vars.jjokji5 == false and player_vars.jjokji6 == false and player_vars.jjokji7 == false:
			if player_vars.finish_timing == false:
				self.add_child(Transition.instance())
				$TransitionScene.transition()
				player_vars.finish_timing = true
				#get_tree().change_scene("res://FinalScene.tscn")
			

