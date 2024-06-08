extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	self.queue_free()


func _on_body_entered(body):
	print("eee")
	if body.has_method("take_damage"):
		print("www")
		body.take_damage(false)
