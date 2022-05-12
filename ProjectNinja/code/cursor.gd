extends Node2D



onready var parentPos = get_parent().position 

func _process(delta):

	self.position = get_viewport().get_mouse_position()  + get_parent().camera.offset
	
	if Input.is_action_just_pressed("leftMouse"):
		startLine()
	
func startLine():
	
	for body in $Area2D.get_overlapping_bodies():
		if body.name == "TileMap":
	
			get_parent().getVectorToCursor()
