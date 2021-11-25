extends Node2D

var walk = 0

func _process(delta):
	
	if Input.is_action_pressed("ui_left"):
		
		self.visible = true
		
		if int(walk) % 2 == 0:
			self.get_node("Player_left_r").visible = false
			self.get_node("Player_left_l").visible = true
		else:
			self.get_node("Player_left_l").visible = false
			self.get_node("Player_left_r").visible = true
			
		walk += 0.1
		
	else:
		self.visible = false

	
