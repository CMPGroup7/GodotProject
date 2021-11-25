extends Node2D



func _process(delta):
	
	if Input.is_action_pressed("ui_up"):
		self.visible = false
	if Input.is_action_pressed("ui_left"):
		self.visible = false
	elif Input.is_action_pressed("ui_right"):
		self.visible = false
	else:
		self.visible = true

	
