extends Camera2D

class_name CameraRoot

var camY_pos = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# set position of UI group and cameraroot
func updatePos(valueY):
	if(valueY >= self.drag_margin_bottom):
		self.set_position(Vector2(0, valueY))
		if($Cam_X.current == true):
			$UI_Group.set_position(Vector2(0, 0))
		else:
			$UI_Group.set_position(Vector2(618, 0))
		
	elif(valueY <= self.drag_margin_bottom):
		self.set_position(Vector2(0, valueY))

# A function that change position of camera and ui group when player go to side next to it.
func _on_camX_area_entered(body):
	if(body is PlayerNode):
		if($Cam_Z.current == true):
			$Cam_X.current = true
			$UI_Group.set_position(Vector2(618, 0))
		else:
			$Cam_X.current = true
			$UI_Group.set_position(Vector2(0, 0))

# A function that change position of camera and ui group when player go to side next to it.
func _on_camZ_area_entered(body):
	if body is PlayerNode:
		if($Cam_X.current == true):
			$Cam_Z.current = true
			$UI_Group.set_position(Vector2(618, 0))
		else:
			$Cam_Z.current = true
			$UI_Group.set_position(Vector2(0, 0))
