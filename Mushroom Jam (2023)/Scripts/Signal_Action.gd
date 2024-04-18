extends Node3D
var score : int

func _ready():
	score = 0
	
func _on_area_collision_die_body_entered(_body):
	call_deferred("change_scene_menu")

func change_scene_menu():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_area_collision_attack_body_entered(_body):
	Autoload.enemy_status = "Die"
	score+=1
	$Score.text = str(score)
	
	
