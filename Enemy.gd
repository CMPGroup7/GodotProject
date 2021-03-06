extends KinematicBody2D

var enemy_velocity = Vector2()
const enemy_gravity = 200.0
var WALK_SPEED = 20
var change_direction = false

onready var animationPlayer = $AnimationPlayer  #enemy animation
onready var tile_rayCast = get_node("DetectTile") # raycast for detect tile whether enemy should change direction
onready var playerTop_rayCast = get_node("DetectPlayerTop") 

#enemy's movement
func _physics_process(delta):
	
	animationPlayer.play("enemy_walk")
	
	enemy_velocity.y += delta * enemy_gravity
	enemy_velocity.x = -WALK_SPEED
	
	move_and_slide(enemy_velocity)
	
	try_interact_tile()

# A function that makes enemy to move back and forth on the block
func try_interact_tile():

	var collider = tile_rayCast.get_collider()
	
	if tile_rayCast.is_colliding():
		if change_direction == true:
			change_direction = false

	else :
		if change_direction == false:
			change_direction = true
			self.scale.x *= -1
			WALK_SPEED = -WALK_SPEED


