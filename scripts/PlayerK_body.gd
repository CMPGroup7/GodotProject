extends Node2D

var check_jump = Vector2()


func _process(delta):
	

	if Input.is_action_pressed("ui_left"):
		self.visible = false
	elif Input.is_action_pressed("ui_right"):
		self.visible = false
	else:
		if get_parent().get_position().y < check_jump.y and not get_parent().is_on_floor():
			self.get_node("Player_front").visible = false
			self.get_node("Player_jump").visible = true
			pass
		else:
			self.get_node("Player_jump").visible = false
			self.get_node("Player_front").visible = true
		check_jump = get_parent().get_position()
		self.visible = true

	
