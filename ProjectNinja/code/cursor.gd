extends Node2D



onready var parentPos = get_parent().position 

func _process(delta):

	self.position = get_viewport().get_mouse_position() - Vector2(512,300)
	
	
	if Input.is_action_just_pressed("leftMouse"):
		startLine()
	
func startLine():

	get_parent().getVectorToCursor()
