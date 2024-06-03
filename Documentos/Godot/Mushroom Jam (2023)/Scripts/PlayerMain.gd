extends CharacterBody3D
@export var velocty = 1
var direction : Vector3
var sprite_position : String
var moving : bool
var position_comparison : Vector3


func _ready():
	moving = false
	sprite_position = "up"
	position = Vector3(0,0,0)
	position_comparison = position
	
func player_main(delta):
	player_move(delta)
	player_attack()
	position_update()
	player_update()
	move_and_slide()

func player_move(delta):
	#Moving
	if (Input.is_action_pressed("move_up")||Input.is_action_pressed("move_down")||Input.is_action_pressed("move_right")||Input.is_action_pressed("move_left")):
		$PlayerSprite.play("move_" + sprite_position)
		$PlayerParticlesSteps.emitting = true
		if Input.is_action_pressed("move_up"):
			#Atack changes
			if $AreaCollisionAttack/SlashSprite.frame != 3 && sprite_position != "up":
				pass
			else:
				#Player changes
				sprite_position = "up"
				position.x += delta * velocty
				$AreaCollisionAttack.rotation_degrees.y = 0
			
		elif Input.is_action_pressed("move_down"):
			#Atack changes
			if $AreaCollisionAttack/SlashSprite.frame != 3 && sprite_position != "down":
				pass
			else:
				#Player changes
				sprite_position = "down"
				position.x -= delta * velocty
				$AreaCollisionAttack.rotation_degrees.y = -180
			
		elif Input.is_action_pressed("move_right"):
			#Atack changes
			if $AreaCollisionAttack/SlashSprite.frame != 3 && sprite_position != "right":
				pass
			else:
				#Player changes
				sprite_position = "right"
				position.z += delta * velocty
				$AreaCollisionAttack.rotation_degrees.y = -90
			
		elif Input.is_action_pressed("move_left"):
			#Atack changes
			if $AreaCollisionAttack/SlashSprite.frame != 3 && sprite_position != "left":
				pass
			else:
				#Player changes
				sprite_position = "left"
				position.z -= delta * velocty
				$AreaCollisionAttack.rotation_degrees.y = -270
			
	#Player on the move == False
	if (!moving):
		$PlayerParticlesSteps.emitting = false
		$PlayerSprite.play("static_" + sprite_position)
		
func position_update():
	if position_comparison != position:
		moving = true
	else:
		moving = false
	
	position_comparison = position

func player_update():
	Autoload.player_sprite = sprite_position
	Autoload.player_moving = moving
	Autoload.player_position = position

func player_attack():
	if Input.is_action_pressed("action") && $AreaCollisionAttack/SlashSprite.frame == 3 && $SlashReload.frame == 8:
		$AreaCollisionAttack/SlashSprite.play("Slash")
		$SlashReload.play("Reload")
		$AreaCollisionAttack.monitoring = true
	else:
		$AreaCollisionAttack.monitoring = false


