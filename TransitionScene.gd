extends CanvasLayer

signal transitioned

	
func transition():
	$AnimationPlayer.play("fade_to_black")
	print("Fading to black")
	
func reTransition():
	$AnimationPlayer.play("fade_to_normal")
	print("Finish fading")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		get_tree().change_scene("res://FinalScene.tscn")

