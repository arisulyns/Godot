extends Node3D
var Player
var Camera
var Enemy

func _ready():
	Player = get_node("PlayerMain")
	Camera = get_node("CameraBody")
	Enemy = get_node("EnemyMain")
	
#Looping+
func _physics_process(delta):
	Player.player_main(delta)
	Camera.camera_move(delta)
	Enemy.enemy_main(delta)
	
	
#Signal






	
	
