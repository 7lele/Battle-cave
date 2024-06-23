extends Area2D
var bo

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_body_entered(body):
	print("eee")
	bo = body
	if body.has_method("slow"):
		print("www")
		body.slow()
		body.modulate = Color.SKY_BLUE


func _on_time_timeout():
	queue_free()
