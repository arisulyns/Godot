extends Node2D

func _process(_delta):
	if Input.is_action_pressed("action"):
		get_tree().change_scene_to_file("res://Scenes/cena1.tscn")
	
	
