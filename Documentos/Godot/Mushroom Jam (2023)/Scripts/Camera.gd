extends CharacterBody3D
@onready var target: Object = get_parent().get_node("PlayerMain")
@export var smooth_speed: float = 1
@export var offset: Vector3 = Vector3(-2.8,1.2,0)


func camera_move(delta: float) -> void:
	move_and_slide()
	if (!Autoload.player_moving):
		offset = Vector3(-2.8,1.2,0)
	elif Autoload.player_sprite == "up":
		offset = Vector3(-0.5,1.2,0)
	elif Autoload.player_sprite == "down":
		offset = Vector3(-4.5,1.2,0)
	elif Autoload.player_sprite == "left":
		offset = Vector3(-2.8,1.2,-1.5)
	elif Autoload.player_sprite == "right":
		offset = Vector3(-2.8,1.2,1.5)
		
		
	if(target != null):
		self.position = lerp(self.position, target.position + offset, smooth_speed * delta)


