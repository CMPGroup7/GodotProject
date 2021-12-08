extends KinematicBody2D

class_name PlayerNode

const gravity = 200.0
const WALK_SPEED = 60
const JUMP_FORCE = 125

var if_collide_enemy = false

var jump_count = 0

var velocity = Vector2()
var return_pos = Vector2()

onready var animationPlayer = $AnimationPlayer
onready var restart_pos = self.get_position()

var life = 3;

onready var player_vars = get_node("/root/GlobalVariables")

func _physics_process(delta):
	
	velocity.y += delta * gravity

	if Input.is_action_just_pressed("ui_select"):
		# can only jump twice in a row
		if is_on_floor():
			velocity.y = -JUMP_FORCE
			jump_count = 1
		elif not is_on_floor() and jump_count == 1:
			velocity.y = -JUMP_FORCE
			jump_count += 1
		else:
			jump_count = 0

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
		updatePos(return_pos.x, return_pos.y)
		life -= 1
		print("fall")
		match[life]:
			[2]:get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life").queue_free()
			[1]:get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life2").queue_free()
			[0]:
				get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life3").queue_free()
				get_node("/root/World/CameraRoot/UI_Group/GameOver").visible = true
				get_tree().paused = true
		
	
	
	velocity = move_and_slide(velocity, Vector2.UP)
	move_and_slide(velocity, Vector2(0, -1))


	#check collision with enemy
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision != null and 'Enemy' in collision.collider.name :
			if if_collide_enemy == false :
				print("Collided with: ", collision.collider.name)
				life -= 1
				match[life]:
					[2]:get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life").queue_free()
					[1]:get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life2").queue_free()
					[0]:
						get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life3").queue_free()
						get_node("/root/World/CameraRoot/UI_Group/GameOver").visible = true
						get_tree().paused = true

				if life > 0 :
					if_collide_enemy = true
					get_tree().paused = true
					yield(get_tree().create_timer(1.0), "timeout")
					get_tree().paused = false
					self.set_position(restart_pos)
					yield(get_tree().create_timer(1.0), "timeout")
					if_collide_enemy = false
				

	#if(CameraRoot is.... ready):
	get_node("/root/World/CameraRoot").updatePos(self.get_position().y)

func wait(s):
	var t = Timer.new()
	t.set_wait_time(s)
	t.set_one_shot(true)
	self.get_tree().root.add_child(t)
	t.start()
	print("hi")
	yield(t, "timeout")
	t.queue_free()

func updatePos(valueX, valueY):
	if(valueY is bool):
		self.set_position(Vector2(valueX, self.get_position().y))
	else:
		self.set_position(Vector2(valueX, valueY))
	#get_node("/root/World/CameraRoot").updatePos(valueY)

