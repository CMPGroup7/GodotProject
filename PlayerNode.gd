extends KinematicBody2D

const gravity = 200.0
const WALK_SPEED = 100
const JUMP_FORCE = 125

var facing_left = true

var velocity = Vector2()
var return_pos = Vector2()

func _physics_process(delta):
	
	velocity.y += delta * gravity
	
	if facing_left == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
	
	if Input.is_action_pressed("ui_select") and is_on_floor():
		velocity.y = -JUMP_FORCE

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
		facing_left = true

	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
		facing_left = false

	else:
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
		self.set_position(return_pos)

	
	velocity = move_and_slide(velocity, Vector2.UP)
	move_and_slide(velocity, Vector2(0, -1))


func _on_Door_body_entered(body):
	get_tree().change_scene("res://Level2.tscn")
	
func _on_Door2_body_entered(body):
	get_tree().change_scene("res://Level3.tscn")

func _on_Door3_body_entered(body):
	get_tree().change_scene("res://Level4.tscn")
