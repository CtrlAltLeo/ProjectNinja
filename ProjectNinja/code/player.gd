extends KinematicBody2D

var hp = 3

var speed = 100
var y_velo = 0

var grappleEffects = Vector2()

const GRAVITY = 15
const JUMP_HEIGHT = -400

onready var camera = $playerCam
onready var grapple = $grapplez
onready var cursor = $cursor



func _physics_process(delta):
	
	var direction = Vector2()
	
	direction.x = Input.get_action_strength("D") - Input.get_action_strength("A")
	
	direction.x = direction.x * speed
	
#	direction = direction + grappleEffects
	
	y_velo += GRAVITY
	
	direction.y = y_velo
	
	move_and_slide(direction, Vector2(0,-1))
	
	if is_on_floor():
		y_velo = 0
		
	if is_on_floor() and Input.is_action_just_pressed("space"):
		y_velo = JUMP_HEIGHT
		
	if y_velo < 0 and Input.is_action_just_released("space"):
		y_velo += 200
