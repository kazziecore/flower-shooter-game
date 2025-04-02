extends Area2D

var direction : Vector2
const speed = 10

func _physics_process(_delta: float) -> void:
	global_position += direction * speed




func _on_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.queue_free()
		queue_free()
