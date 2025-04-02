extends CharacterBody2D

var bullet_scene = preload("res://scenes/bullet.tscn")
const speed = 200
@onready var shooty_part = $shootypart

func _physics_process(_delta: float) -> void:
	look_at(get_global_mouse_position())

	velocity.x = Input.get_axis("left", "right") * speed
	velocity.y = Input.get_axis("up", "down") * speed
	velocity = lerp(get_real_velocity(), velocity, 0.1)
	
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_scene.instantiate()
		bullet.global_position = shooty_part.global_position
		bullet.direction = (get_global_mouse_position() - global_position).normalized()
		$/root/Game.add_child(bullet)

	move_and_slide()
