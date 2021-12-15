extends KinematicBody2D

class_name PlayerNode

#Press tab to collect all Jjokji automatically

const gravity = 200.0
const WALK_SPEED = 60
const JUMP_FORCE = 125

var if_collide_enemy = false

var jump_count = 0

var velocity = Vector2()
var return_pos = Vector2()

onready var animationPlayer = $AnimationPlayer
onready var restart_pos = self.get_position()

#Load global variables as local player variables linked to the global ones
onready var player_vars = get_node("/root/GlobalVariables")

func _process(delta):
	
	#Check if each jjokji exists, if not show corresponding letter
	if player_vars.jjokji1 == false:
		get_node("/root/World/CameraRoot/UI_Group/TextGroup/P").visible = true
	if player_vars.jjokji2 == false:
		get_node("/root/World/CameraRoot/UI_Group/TextGroup/R").visible = true
	if player_vars.jjokji3 == false:
		get_node("/root/World/CameraRoot/UI_Group/TextGroup/E").visible = true
	if player_vars.jjokji4 == false:
		get_node("/root/World/CameraRoot/UI_Group/TextGroup/S").visible = true
	if player_vars.jjokji5 == false:
		get_node("/root/World/CameraRoot/UI_Group/TextGroup/E2").visible = true
	if player_vars.jjokji6 == false:
		get_node("/root/World/CameraRoot/UI_Group/TextGroup/N").visible = true
	if player_vars.jjokji7 == false:
		get_node("/root/World/CameraRoot/UI_Group/TextGroup/T").visible = true
	
	#Match cases of life variable's values (integers) below 3 
	#and empty if not already emptied (delete node)
	match[player_vars.life]:
			[2]:
				if get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life") != null:
					get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life").queue_free()
			[1]:
				if get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life")!= null:
					get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life").queue_free()
				if get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life2")!= null:
					get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life2").queue_free()
			[0]:
				if get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life")!= null:
					get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life").queue_free()
				if get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life2")!= null:
					get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life2").queue_free()
				if get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life3")!= null:
					get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life3").queue_free()
					get_node("/root/World/CameraRoot/UI_Group/GameOver").visible = true
					get_tree().paused = true #Pause if 0. Stops all player process functions
	

func _physics_process(delta):
	
	velocity.y += delta * gravity
	
	if Input.is_action_just_pressed("ui_focus_next"): #Press tab to cheat
		player_vars.jjokji1 = false
		player_vars.jjokji2 = false
		player_vars.jjokji3 = false
		player_vars.jjokji4 = false
		player_vars.jjokji5 = false
		player_vars.jjokji6 = false
		player_vars.jjokji7 = false
	
	if Input.is_action_just_pressed("ui_select"): #Jump on space bar. Interaction on "ui_accept"
		# can only jump twice in a row
		if is_on_floor():
			velocity.y = -JUMP_FORCE
			jump_count = 1
			$MusicJump.play()
		elif not is_on_floor() and jump_count == 1:
			velocity.y = -JUMP_FORCE
			jump_count += 1
			$MusicJump.play()
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
		if not (player_vars.jjokji1 == false and player_vars.jjokji2 == false and player_vars.jjokji3 == false and player_vars.jjokji4 == false and player_vars.jjokji5 == false and player_vars.jjokji6 == false and player_vars.jjokji7 == false):
			player_vars.life -= 1
			get_node("/root/World/MusicFail").play()
			print("fall")
			match[player_vars.life]: #To avoid player not dying and getting Game Over in the end
						
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
			#print("hello")
			if if_collide_enemy == false :
				print("Collided with: ", collision.collider.name)
				if not (player_vars.jjokji1 == false and player_vars.jjokji2 == false and player_vars.jjokji3 == false and player_vars.jjokji4 == false and player_vars.jjokji5 == false and player_vars.jjokji6 == false and player_vars.jjokji7 == false):
					player_vars.life -= 1
					get_node("/root/World/MusicFail").play()
					match[player_vars.life]: #To avoid player not dying and getting Game Over in the end
						
						[2]:get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life").queue_free()
						[1]:get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life2").queue_free()
						[0]: 
							get_node("/root/World/CameraRoot/UI_Group/LifeGroup/Life3").queue_free()
							get_node("/root/World/CameraRoot/UI_Group/GameOver").visible = true
							get_tree().paused = true
				

					if player_vars.life > 0 :
						if_collide_enemy = true
						get_tree().paused = true
						yield(get_tree().create_timer(1.0), "timeout")
						get_tree().paused = false
						self.set_position(restart_pos)
						yield(get_tree().create_timer(1.0), "timeout")
						if_collide_enemy = false
				
	
	#Update CameraRoot position through its updatePos function to the player node position
	get_node("/root/World/CameraRoot").updatePos(self.get_position().y)

#Player's own updatePos function
func updatePos(valueX, valueY):
	if(valueY is bool):
		self.set_position(Vector2(valueX, self.get_position().y))
	else:
		self.set_position(Vector2(valueX, valueY))

