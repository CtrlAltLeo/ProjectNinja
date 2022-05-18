extends KinematicBody2D


var hp = 100

var speed = 100
var y_velo = 0

var grappleEffects = Vector2()
var grappleSpeed = 0
var isGrapple = false

const GRAVITY = 15
const JUMP_HEIGHT = -500
const MAXFALLSPEED = 300

onready var camera = $playerCam
onready var grapple = $grapple
onready var cursor = $cursor

var invulerable = false

var canJump = true



func _physics_process(delta):
	
	$RayCast2D.cast_to = $cursor.position
	
	if $RayCast2D.is_colliding() and canJump:
		if $RayCast2D.get_collider().name == "TileMap":
			$cursor.canClick = true
		else:
			$cursor.canClick = false
	
	$playerCam/RichTextLabel.text = str(hp)

	
	var direction = Vector2()
	
	direction.x = Input.get_action_strength("D") - Input.get_action_strength("A")
	
	direction.x = direction.x * speed
	
	y_velo += GRAVITY
	
	direction.y = y_velo
	
	if y_velo > MAXFALLSPEED:
		y_velo = MAXFALLSPEED
	
	move_and_slide(direction + grappleEffects * grappleSpeed, Vector2(0,-1))
	
	if is_on_floor():
		y_velo = 0
		grappleSpeed = 0
		speed = 200
	if is_on_floor() and Input.is_action_just_pressed("space"):
		y_velo = JUMP_HEIGHT
	if isGrapple:
		speed = 0
	if grappleSpeed != 0:
		isGrapple = true
	else:
		isGrapple = false
	if y_velo < 0 and Input.is_action_just_released("space"):
		y_velo += 100
		
	if grappleSpeed > 5:
		grappleSpeed = grappleSpeed * pow(2.71, -0.01)
		

func getVectorToCursor():
	
	var v = (cursor.global_position - self.position).normalized()
	
	grappleEffects = v
	grappleSpeed = 500
	
	$grappleTimer.start()
	canJump = false
	

func takeDamage(d):
	
	if invulerable == false:
	
		calculateDamage(d)
		invulerable = true
	
func calculateDamage(d):
	
	if hp - d > 0:
		hp -= d
		$AnimationPlayer.play("hurt")
	else:
		die()
		
func die():
	hp = 100
	self.position = get_parent().respawnPos



func _on_AnimationPlayer_animation_finished(anim_name):
	invulerable = false


func _on_grappleTimer_timeout():
	canJump = true
