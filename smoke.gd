extends AnimatedSprite2D

@onready var particles:CPUParticles2D = $CPUParticles2D
func _ready():
	particles.emitting = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	queue_free()
