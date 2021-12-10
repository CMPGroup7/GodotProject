extends Area2D

class_name Door

export(String, FILE, "*.tscn") var path_to_scene

signal my_signal(value1, value2)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if(get_overlapping_bodies().size() > 0):
			_to_other_scene()
			get_node("/root/World/MusicDoor").play()

func _to_other_scene():
	get_tree().change_scene(path_to_scene)
	GlobalVariables.cur_door = name

func _on_Door_my_signal(value1, value2):
	print (value1, value2)

func _on_fromRightDoor_body_entered(body):
	if(body is PlayerNode):
		get_node("/root/World/PlayerNode").updatePos(self.get_position().x +32, false)
		#$PlayerNode.restart_pos = Vector2(self.get_position().x +32)
		get_node("/root/World/PlayerNode").restart_pos = Vector2(self.get_position().x +32, get_node("/root/World/PlayerNode").get_position().y)
		print("fromRight")

func _on_fromLeftDoor_body_entered(body):
	if(body is PlayerNode):
		get_node("/root/World/PlayerNode").updatePos(self.get_position().x -32, false)
		get_node("/root/World/PlayerNode").restart_pos = Vector2(self.get_position().x -32, get_node("/root/World/PlayerNode").get_position().y)
		#$PlayerNode.restart_pos = Vector2(self.get_position().x -32)
		print("fromLeft")
