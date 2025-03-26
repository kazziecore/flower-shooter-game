extends Sprite2D

@onready var Shadow: Sprite2D = $Sprite2D
@onready var AnimPlayer: AnimationPlayer = $AnimationPlayer
@onready var RayCast: RayCast2D = $RayCast2D

var speed: float = 120.0

func _physics_process(delta: float) -> void:
	global_position += Vector2(1, 0).rotated(rotation) * speed * delta
	Shadow.position = Vector2(-2, 2).rotated(-rotation)
	if RayCast.is_colliding() and !RayCast.get_collider().get("IS_PLAYER"):
		AnimPlayer.play("remove")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "remove":
		queue_free()

func _on_distance_timeout_timeout() -> void:
	AnimPlayer.play("remove")
	pass # Replace with function body.
