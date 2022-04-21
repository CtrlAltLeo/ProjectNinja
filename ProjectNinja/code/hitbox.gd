extends Area2D

export (String, "hitbox", "hurtbox") var boxType

signal hit



func _process(delta):
	
	for collider in get_overlapping_areas():
		
		if !collider.has_method("hitbox"):
			continue
		
		if boxType == "hitbox" and collider.boxtype == "hurtbox":
			emit_signal("hit")
			
func hitbox():
	pass
