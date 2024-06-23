extends Area2D

var trav_d = 0

func _physics_process(delta):
	const SPEED = 380
	const RANGE = 370
	var direction = Vector2.UP.rotated(rotation)
	position += direction * SPEED * delta
	
	trav_d += SPEED * delta
	if trav_d > RANGE:
		queue_free()


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(true)
