extends Area2D

func _physics_process(delta):
	$Timer.wait_time = Global.bullet_speed
	var ennemies_ir = get_overlapping_bodies()
	
	if ennemies_ir.size() > 0:
		var target_enemy = ennemies_ir.front()
		look_at(target_enemy.global_position)
		
		
func shoot():
		const BULLET = preload("res://Scenes.tscn/bullet.tscn")
		var new_bullet = BULLET.instantiate()
		new_bullet.global_position = %shoot.global_position
		new_bullet.global_rotation = %shoot.global_rotation
		%shoot.add_child(new_bullet)


func _on_timer_timeout():
	shoot()
