extends Area2D

var direction : Vector2
const speed = 10
var explosion_scene = preload("res://scenes/explosion.tscn")

func _physics_process(_delta: float) -> void:
	global_position += direction * speed




func _on_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.queue_free()
		queue_free()
		
		GameManager.add_score(1)
		
		var explosion = explosion_scene.instantiate()
		explosion.global_position = global_position
		explosion.emitting = true
		explosion.lifetime = randi_range(0.3, 0.7)
		
		$/root/Game.add_child(explosion)
