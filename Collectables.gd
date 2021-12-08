extends Area2D
class_name Collectables

onready var animationPlayer = $AnimationPlayer
onready var global_vars = get_node("/root/GlobalVariables")
func _on_Jjokji_body_entered(body):
	animationPlayer.play("OpenJjokji")
	yield(animationPlayer, "animation_finished")
	self.queue_free()
	global_vars.collected += 1 
	print(global_vars.collected)
	match[global_vars.collected]:
		[1]: get_node("/root/World/CameraRoot/UI_Group/TextGroup/P").visible = true
		[2]: get_node("/root/World/CameraRoot/UI_Group/TextGroup/R").visible = true
		[3]: get_node("/root/World/CameraRoot/UI_Group/TextGroup/E").visible = true
		[4]: get_node("/root/World/CameraRoot/UI_Group/TextGroup/S").visible = true
		[5]: get_node("/root/World/CameraRoot/UI_Group/TextGroup/E2").visible = true
		[6]: get_node("/root/World/CameraRoot/UI_Group/TextGroup/N").visible = true
		[7]: get_node("/root/World/CameraRoot/UI_Group/TextGroup/T").visible = true	
