extends Area2D

export (String, "hitbox", "hurtbox") var boxType

export var damage = 0

signal hit
signal hurt(d)
signal deliverHit

var isHit = false



func _process(delta):
	
	for collider in get_overlapping_areas():
		
		
		if not "boxType" in collider:
			continue
		
		
		if isHit: 
			return
		
		if boxType == "hitbox" and collider.boxType == "hurtbox":
			emit_signal("hit", damage)
			collider.emit_signal("hurt", damage)
			
			isHit = true
			print("hit")
			
			
	if get_overlapping_areas() == []:
		isHit = false
	
	
		
			
func hitbox():
	pass
