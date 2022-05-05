extends KinematicBody2D


var movementDirection = Vector2(-1, 0)

export var HP = 0
export var damageToPlayer = 5
export var speed = 10

var yVelo = 0
const max_fall_speed = 40

func _physics_process(delta):
	
	var direction = Vector2()
	
	direction = direction + movementDirection
	
	move_and_slide(direction * speed)
	
	
func flip():
	
	movementDirection *= -1
	
	

	
	

	
	


func flipcasterenterBody(body):
	
	flip()
