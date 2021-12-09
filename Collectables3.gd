extends Area2D
class_name Collectables3

onready var animationPlayer = $AnimationPlayer
onready var global_vars = get_node("/root/GlobalVariables")

var exist = null

func _ready():
	exist = global_vars.jjokji3
	if not exist:
		queue_free()

func _on_Jjokji_body_entered(body):
	animationPlayer.play("OpenJjokji")
	yield(animationPlayer, "animation_finished")
	global_vars.jjokji3 = false
	self.queue_free()


