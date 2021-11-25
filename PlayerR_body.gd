extends Node2D

var walk = 0


func _process(delta):

	if Input.is_action_pressed("ui_right") and get_parent().is_on_floor():
		
		self.visible = true
		
		if int(walk) % 2 == 0:
			self.get_node("Player_right_r").visible = false
			self.get_node("Player_right_l").visible = true
		else:
			self.get_node("Player_right_l").visible = false
			self.get_node("Player_right_r").visible = true
			
		walk += 0.1
		
	elif Input.is_action_pressed("ui_right") and not get_parent().is_on_floor():
		
		self.visible = true
		self.get_node("Player_right_l").visible = true
		
	else:
		self.visible = false
