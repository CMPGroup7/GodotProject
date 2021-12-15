extends Area2D
class_name Collectables4

onready var animationPlayer = $AnimationPlayer # animation for collectables
onready var global_vars = get_node("/root/GlobalVariables") # get global variables

var exist = null
# If the note is not collected by checking whether it is collected, it will not be shown.
func _ready():
	exist = global_vars.jjokji4
	if not exist:
		queue_free()
# collect note. play animation for jjokji. show what message that player collected
func _on_Jjokji_body_entered(body):
	animationPlayer.play("OpenJjokji")
	yield(animationPlayer, "animation_finished")
	global_vars.jjokji4 = false
	self.queue_free()
	get_node("/root/World/MusicCollect").play()

