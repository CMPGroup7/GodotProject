extends Area2D

class_name Door

export(String, FILE, "*.tscn") var path_to_scene

signal my_signal(value1, value2)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Player presses E or the Enter key to go in the the door
func _input(event):
	if event.is_action_pressed("ui_accept"): 
		if(get_overlapping_bodies().size() > 0):
			_to_other_scene()
			get_node("/root/World/MusicDoor").play()

# function to change scene when player wants to go in/out of the map
func _to_other_scene():
	get_tree().change_scene(path_to_scene)
	GlobalVariables.cur_door = name

func _on_Door_my_signal(value1, value2):
	print (value1, value2)

# function for move to left scene by right corner
func _on_fromRightDoor_body_entered(body):
	if(body is PlayerNode):
		get_node("/root/World/PlayerNode").updatePos(self.get_position().x +32, false)
		#$PlayerNode.restart_pos = Vector2(self.get_position().x +32)
		get_node("/root/World/PlayerNode").restart_pos = Vector2(self.get_position().x +32, get_node("/root/World/PlayerNode").get_position().y)
		print("fromRight")

#function for move to right scene by left corner
func _on_fromLeftDoor_body_entered(body):
	if(body is PlayerNode):
		get_node("/root/World/PlayerNode").updatePos(self.get_position().x -32, false)
		get_node("/root/World/PlayerNode").restart_pos = Vector2(self.get_position().x -32, get_node("/root/World/PlayerNode").get_position().y)
		#$PlayerNode.restart_pos = Vector2(self.get_position().x -32)
		print("fromLeft")
