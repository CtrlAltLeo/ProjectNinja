extends Node2D

func _ready():

	$AudioStreamPlayer.play()


func _on_play_pressed():
	get_tree().change_scene("res://levels/leoLavaLand.tscn")


func _on_quit_pressed():
	
	get_tree().quit()
