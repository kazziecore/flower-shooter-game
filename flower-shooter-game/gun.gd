extends Node2D

const bullet_scene = preload("res://bullet.tscn")

const IS_PLAYER = true

@onready var RotationOffset: Node2D = $RotationOffset
@onready var SpriteShadow: Sprite2D = $RotationOffset/Sprite2D/Shadow
@onready var ShootPos: Marker2D = $RotationOffset/Sprite2D/shoot_pos

var time_between_shot: float = 0.25
var can_shoot: bool = true

func _ready() -> void:
		$ShootTimer.wait_time = time_between_shot

func _physics_process(delta: float) -> void:
	RotationOffset.rotation = lerp_angle(RotationOffset.rotation, ( get_global_mouse_position() - global_position ).angle(), 6.5*delta)
	SpriteShadow.position = Vector2(-2, 2).rotated(-RotationOffset.rotation)
	
	if Input.is_action_just_pressed("shoot") and can_shoot:
		_shoot()
		can_shoot = false
		$ShootTimer.start()

func _shoot():
	var new_bullet = bullet_scene.instantiate()
	new_bullet.global_position = ShootPos.global_position
	new_bullet.global_position = ShootPos.global_rotation
	new_bullet.speed = 120.0
	get_parent().add_child(new_bullet)

func _on_shoot_timer_timeout() -> void:
	can_shoot = true
	pass # Replace with function body.
