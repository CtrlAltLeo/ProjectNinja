extends KinematicBody2D


var movementDirection = Vector2(-1, 0)

export var HP = 0
export var damageToPlayer = 5
export var speed = 10
const GRAVITY = 15
const JUMP_HEIGHT = -400
const MAXFALLSPEED = 200

var y_velo = 0
const max_fall_speed = 40

func _ready():
	$hitBox.damage = damageToPlayer

func _physics_process(delta):
	
	var direction = Vector2()
	
	direction = direction + movementDirection
	
	y_velo += GRAVITY
	
	direction.y = y_velo
	
	if y_velo > MAXFALLSPEED:
		y_velo = MAXFALLSPEED
	
	move_and_slide(direction * speed)
	
	
func flip():
	
	movementDirection *= -1


func flipcasterenterBody(body):
	
	flip()
	
func die():
	queue_free()
