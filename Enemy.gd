extends KinematicBody2D

var velocity = Vector2()
const gravity = 200.0
onready var animationPlayer = $AnimationPlayer
func _physics_process(delta):
	animationPlayer.play("enemy_walk")
	velocity.y += delta * gravity
	move_and_collide(velocity)
