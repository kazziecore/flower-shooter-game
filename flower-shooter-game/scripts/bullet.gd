extends Area2D

var direction : Vector2
const speed = 10

func _physics_process(delta: float) -> void:
	global_position += direction * speed




func _on_timer_timeout() -> void:
	queue_free()
