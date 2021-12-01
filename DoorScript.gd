extends Area2D

class_name Door

export(String, FILE, "*.tscn") var path_to_scene

signal my_signal(value1, value2)

# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("my_signal", get_instance_id (), true)

func _on_Door_body_entered(body):
	if(body is PlayerNode and ResourceLoader.exists(path_to_scene)):
		get_tree().change_scene(path_to_scene)

func _on_Door_my_signal(value1, value2):
	print (value1, value2)

func _on_fromRightDoor_body_entered(body):
	if(body is PlayerNode):
		get_node("/root/World/PlayerNode").updatePos(self.get_position().x +64, false)
		print("fromRight")

func _on_fromLeftDoor_body_entered(body):
	if(body is PlayerNode):
		get_node("/root/World/PlayerNode").updatePos(self.get_position().x -64, false)
		print("fromLeft")
