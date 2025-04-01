extends CharacterBody2D

@onready var player = $"."

const speed = 100

func _physics_process(delta: float) -> void:
	velocity = (player.global_position - global_position).normalized() * speed
	
	look_at(player.global_position)
	
	move_and_slide()
