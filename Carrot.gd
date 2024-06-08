extends CharacterBody2D


var health = 100.0
var speed = 120 
var max_health = Global.ply_max_health
signal Health_depleted
func _physics_process(delta):

	if Global.bulle == true:
		print("bulle")
		%protection.start(8)
		Global.bulle = false
		








	if Global.lifebar == true:
		%ProgressBar.show()
	else:
		
		%ProgressBar.hide()
		
	Global.X = global_position.x
	Global.Y = global_position.y
	
	if Input.is_action_just_pressed("gauche") and Global.bombe == true:
		
		var NEW = preload("res://Scenes.tscn/boum.tscn").instantiate()
		NEW.position = self.position
		$"../Eyepoint".add_child(NEW)
		Global.bombe = false
	if Input.is_action_just_pressed("gauche") and Global.glue == true:
		
		var NEW = preload("res://Scenes.tscn/splatch.tscn").instantiate()
		NEW.position = self.position
		NEW.z_index = -1
		$"../Eyepoint".add_child(NEW)
		Global.glue = false
		
	if Input.is_action_just_pressed("gauche") and Global.plume == true:
		
		var NEW = preload("res://plumeeffect.tscn").instantiate()
		NEW.position = self.position
		NEW.z_index = -1
		$"../Eyepoint".add_child(NEW)
		Global.plume = false
		
		
		
	max_health = Global.ply_max_health
	%ProgressBar.max_value = max_health
	if health > max_health:
		health = max_health
	$"Node2D/Carrot-item".play("default")
	if Input.is_action_pressed("clic") and Global.BOOST > 0.0 and velocity.length() > 0.0:
		speed = 300 + Global.ply_speed_boost 
		Global.BOOST -= 0.1
		$Node2D/Node2D/AnimatedSprite2D.visible = true
	else:
		speed = 120 + Global.ply_speed_boost 
		$Node2D/Node2D/AnimatedSprite2D.visible= false
	if not Input.is_action_pressed("clic"):
		Global.BOOST += 0.02
	var direction = Input.get_vector("a","d","w","s")
	velocity = direction * speed
	move_and_slide()
	if velocity.length() > 0.0:
		$AnimationPlayer.play("walk")
	else:
		$AnimationPlayer.play("idle")
	var DAMAGE_RATE = Global.degats
	var overlapping_mbs = %HurthBox.get_overlapping_bodies()
	if overlapping_mbs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mbs.size()*delta
		%ProgressBar.value = health
		if health <= 0.1:
			DiscordRPC.state = "Est mort, paix a son Âme" 
			DiscordRPC.refresh() 
			Health_depleted.emit()
	$Node2D/Node2D.look_at(self.global_position + direction)
	
	if self.global_position.y > 710:
		self.global_position.y = 710
	if self.global_position.y < -710:
		self.global_position.y = -710
	if self.global_position.x > 1240:
		self.global_position.x = 1240
	if self.global_position.x < -1220:
		self.global_position.x = -1220

func act():
	%ProgressBar.value = health






func _on_protection_timeout():
	print("protection")
	%duration.start(Global.bultime)
	$Protection.visible = true
	Global.degats = 1.0
	

func _on_duration_timeout():
	$Protection.visible = false
	Global.degats = 5.0
	%protection.start(8)
