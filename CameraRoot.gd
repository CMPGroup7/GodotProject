extends Camera2D

class_name CameraRoot

var camY_pos = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func updatePos(valueY):
	if(valueY >= self.drag_margin_bottom):
		self.set_position(Vector2(0, valueY))
	elif(valueY <= self.drag_margin_bottom):
		self.set_position(Vector2(0, valueY))

func _on_camX_area_entered(body):
	if(body is PlayerNode):
		if($Cam_Z.current == true):
			$Cam_X.current = true
			$UI_Group.set_position(Vector2(618, 0))
		else:
			$Cam_X.current = true
			$UI_Group.set_position(Vector2(0, 0))

func _on_camZ_area_entered(body):
	if(body is PlayerNode):
		if($Cam_X.current == true):
			$Cam_Z.current = true
			$UI_Group.set_position(Vector2(618, 0))
		else:
			$Cam_Z.current = true
			$UI_Group.set_position(Vector2(0, 0))
