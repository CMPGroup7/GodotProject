extends KinematicBody2D

class_name PlayerNode

const gravity = 200.0
const WALK_SPEED = 100
const JUMP_FORCE = 125

var velocity = Vector2()
var return_pos = Vector2()

onready var animationPlayer = $AnimationPlayer

var life = 3;


func _physics_process(delta):
	
	velocity.y += delta * gravity
	
	if Input.is_action_pressed("ui_select") and is_on_floor():
		velocity.y = -JUMP_FORCE


	if Input.is_action_pressed("ui_left"):
		if is_on_floor():
			animationPlayer.play("WalkLeft")
			velocity.x = -WALK_SPEED
		else:
			animationPlayer.play("JumpLeft")
			velocity.x = -WALK_SPEED
			

	elif Input.is_action_pressed("ui_right"):
		if is_on_floor():
			animationPlayer.play("WalkRight")
			velocity.x =  WALK_SPEED
		else:
			animationPlayer.play("JumpRight")
			velocity.x = WALK_SPEED

	else:
		if is_on_floor():
			animationPlayer.play("idle")
			velocity.x = 0
		else:
			animationPlayer.play("Jump")
			velocity.x = 0


	#check return point when player goes out of the screen
	if is_on_floor():
		if Input.is_action_pressed("ui_left"):
			return_pos = Vector2(self.get_position().x+30, self.get_position().y-10)
		 
		elif Input.is_action_pressed("ui_right"):
			return_pos = Vector2(self.get_position().x-30, self.get_position().y-10)
		else:
			return_pos = Vector2(self.get_position().x, self.get_position().y-10)
			
	# go to return point when player goes out of the screen       
	if self.get_position().y > get_viewport_rect().size.y:
		life -= 1
		updatePos(return_pos.x, return_pos.y)
		match[life]:
			[2]:get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life").queue_free()
			[1]:get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life2").queue_free()
			[0]:
				get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life3").queue_free()
				get_node("/root/World/CameraRoot/UI_Group/GameOver").visible = true
				get_tree().paused = true
	
	velocity = move_and_slide(velocity, Vector2.UP)
	move_and_slide(velocity, Vector2(0, -1))
	#if(CameraRoot is.... ready):
	get_node("/root/World/CameraRoot").updatePos(self.get_position().y)

func updatePos(valueX, valueY):
	if(valueY is bool):
		self.set_position(Vector2(valueX, self.get_position().y))
	else:
		self.set_position(Vector2(valueX, valueY))
	#get_node("/root/World/CameraRoot").updatePos(valueY)

