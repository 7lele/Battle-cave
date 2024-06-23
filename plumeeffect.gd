extends Node2D



func _ready():
	Global.ply_speed_boost += 900

func _on_timer_timeout():
	Global.ply_speed_boost -= 900
	queue_free()
