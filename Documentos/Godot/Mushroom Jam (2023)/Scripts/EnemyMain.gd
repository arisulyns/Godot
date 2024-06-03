extends Node3D
@export var velocty = 0.5
@export var marge_space = 0.1
var sprite_position : String

func _ready():
	Autoload.enemy_status = "Life"
	$EnemyParticlesSteps.emitting = true
	sprite_position = "down"


func enemy_main(delta):
	enemy_move(delta)
	enemy_life_or_die()
	
func enemy_move(delta):
	if(Autoload.player_position != position) && Autoload.enemy_status == "Life":
		if(Autoload.player_position.z - marge_space > position.z):
			position.z += delta * velocty
			sprite_position = "right"
		elif(Autoload.player_position.z + marge_space < position.z):
			position.z -= delta * velocty
			sprite_position = "left"
			
		if(Autoload.player_position.x - marge_space > position.x):
			position.x += delta * velocty
			sprite_position = "up"
		elif(Autoload.player_position.x + marge_space < position.x):
			position.x -= delta * velocty
			sprite_position = "down"
		
		$EnemySprite.play("move_"+sprite_position)

func enemy_life_or_die():
	if(Autoload.enemy_status == "Die"):
		$EnemySprite.play("die_"+sprite_position)
		if($EnemySprite.frame == 3):
			Autoload.enemy_status = "Life"
			position.x = Autoload.player_position.x + 2
