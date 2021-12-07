extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print(GlobalVariables.cur_door)
	
	if(GlobalVariables.cur_door):
		var door_node = find_node(GlobalVariables.cur_door)
		if door_node:
			$PlayerNode.global_position = door_node.global_position
