extends Node2D

onready var line = $Line2D

onready var playerPos = get_parent().position

var grapplePos = Vector2()


func _process(delta):
	
	line.set_point_position(0, self.position)
	line.set_point_position(1, get_parent().grappleEffects * 100)
	
	
func startGrapple(direction):
	
	pass
	
	
