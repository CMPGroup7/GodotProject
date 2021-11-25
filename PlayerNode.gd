extends KinematicBody2D

const gravity = 200.0
const WALK_SPEED = 100
const JUMP_FORCE = 100

var velocity = Vector2()


func _physics_process(delta):
	
	velocity.y += delta * gravity
	
	if Input.is_action_pressed("ui_select") and is_on_floor():
		velocity.y = -JUMP_FORCE

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED

	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED

	else:
		velocity.x = 0

	
	velocity = move_and_slide(velocity, Vector2.UP)
	move_and_slide(velocity, Vector2(0, -1))




