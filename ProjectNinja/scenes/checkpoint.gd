extends Node2D

export var targetScenePath = ""



func _on_Area2D_body_entered(body):
	if body.name == "player":
		get_tree().change_scene(targetScenePath)
