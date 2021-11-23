extends KinematicBody2D

const gravity = 200.0
const WALK_SPEED = 200
const JUMP_FORCE = 100

var velocity = Vector2()

func _physics_process(delta):
	velocity.y += delta * gravity

	velocity = move_and_slide(velocity, Vector2.UP)
	move_and_slide(velocity, Vector2(0, -1))
