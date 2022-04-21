extends Area2D

export (String, "hitbox", "hurtbox") var boxType

signal hit

var isHit = false



func _process(delta):
	
	for collider in get_overlapping_areas():
		
		
		if not "boxType" in collider:
			continue
		
		
		if isHit: 
			return
		
		if boxType == "hitbox" and collider.boxType == "hurtbox":
			emit_signal("hit")
			isHit = true
			print("hit")
			
			
	if get_overlapping_areas() == []:
		isHit = false
	
	
		
			
func hitbox():
	pass
