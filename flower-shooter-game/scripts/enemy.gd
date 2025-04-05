extends CharacterBody2D

@onready var player = $/root/Game/player

const speed = 80

func _physics_process(_delta: float) -> void:
	velocity = (player.global_position - global_position).normalized() * speed
	
	look_at(player.global_position)
	
	move_and_slide()
