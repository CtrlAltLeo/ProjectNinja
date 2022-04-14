extends Node2D

onready var line = $Line2D

onready var playerPos = get_parent().position

var grapplePos = Vector2()


func _process(delta):
	
	playerPos = get_parent().position
	
	
func startGrapple(direction):
	
	line.add_point(direction * 10 , 1)
	
	
