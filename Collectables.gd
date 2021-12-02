extends Area2D
class_name Collectables
var collectCount = 0

func _on_Jjokji_body_entered(body):
	self.queue_free()
	collectCount = collectCount + 1
	
#	match[collectCount]:
#		[1]:
#			get_node("/root/World/CameraRoot/P").visible = false
	


