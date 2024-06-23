extends Node2D
var chance = 0
var n_rarté = 3
var r1 = 0
var r2 = 0

var rarté1 = 0 #le nombre de rarté possible (va enlever 1)
var rarté2 = 0 #le nombre de rarté possible (va enlever 1) (pour r2)
var save_path = "user://variable.save"

func spawn_mob():
	chance = randi_range(0,21)
	if chance < 8:
		var EYE_NEW = preload("res://Scenes.tscn/EYE.tscn").instantiate()
		%PathFollow2D.progress_ratio = randf()
		EYE_NEW.global_position = %PathFollow2D.global_position
		$Eyepoint.add_child(EYE_NEW)
	if chance > 7 and chance < 14 :
		var NEW = preload("res://Scenes.tscn/slime.tscn").instantiate()
		%PathFollow2D.progress_ratio = randf()
		NEW.global_position = %PathFollow2D.global_position
		$Eyepoint.add_child(NEW)
	if chance > 13 and chance < 19:
		var NEW = preload("res://Scenes.tscn/blob.tscn").instantiate()
		%PathFollow2D.progress_ratio = randf()
		NEW.global_position = %PathFollow2D.global_position
		$Eyepoint.add_child(NEW)
	if chance == 19 or chance == 20 :
		var NEW = preload("res://Scenes.tscn/Dino.tscn").instantiate()
		%PathFollow2D.progress_ratio = randf()
		NEW.global_position = %PathFollow2D.global_position
		$Eyepoint.add_child(NEW)
	if chance == 21 :
		var NEW = preload("res://Scenes.tscn/pterodactyle.tscn").instantiate()
		%PathFollow2D.progress_ratio = randf()
		NEW.global_position = %PathFollow2D.global_position
		$Eyepoint.add_child(NEW)
	 

func _on_timer_timeout():
	
	if $Eyepoint.get_child_count() < (40 + (Global.LVL * 5)): 
		spawn_mob()
	


func _on_player_health_depleted():
	%Game_Over.visible = true
	$Gui.visible = false
	get_tree().paused = true  
	$item_choice.visible = false

func _on_gui_lvl_up():
	DiscordRPC.state = "a atteint le niveau : " + str(Global.LVL)
	DiscordRPC.refresh() 
	print("gui")
	$item_choice/ColorRect/cube/heart.visible = false
	$item_choice/ColorRect/cube/foot.visible = false
	$item_choice/ColorRect/cube/sab.visible = false
	$item_choice/ColorRect/cube2/heart2.visible = false
	$item_choice/ColorRect/cube2/foot2.visible = false
	$item_choice/ColorRect/cube2/sab2.visible = false
	%attack2.visible = false
	%attack.visible = false
	%bublles.visible = false
	%bublles2.visible = false
	get_tree().paused = true
	$item_choice.visible = true
	rarté1 = randi_range(1, 12)
	if rarté1 < 8:
		r1 = 1
	if rarté1 > 7 and rarté1 < 12:
		r1 = 2
	if rarté1 == 12:
		r1 = 3
	
	if rarté2 < 8:
		r2 = 1
	if rarté2 > 7 and rarté2 < 12:
		r2 = 2
	if rarté2 == 12:
		r2 = 3
		
	if r1 == 1 :
		var Bronze = randi_range(1,2)
		if Bronze == 1:
			$item_choice/ColorRect/cube/heart.visible = true
		if Bronze == 2:
			$item_choice/ColorRect/cube/foot.visible = true
	if r1 == 2 :
		var argent = randi_range(1,1)
		if argent == 1:
			$item_choice/ColorRect/cube/sab.visible = true
		if argent == 2:
			%bublles.visible = true
	if r1 == 3 :
		var gold = randi_range(1,1)
		if gold == 1:
			%attack.visible = true
		
			
			
	if r2 == 1 :
		var Bronze = randi_range(1,2)
		if Bronze == 1:
			$item_choice/ColorRect/cube2/heart2.visible = true
		if Bronze == 2:
			$item_choice/ColorRect/cube2/foot2.visible = true
	if r2 == 2 :
		var argent = randi_range(1,1)
		if argent == 1:
			$item_choice/ColorRect/cube2/sab2.visible = true
	if r2 == 3 :
		var gold = randi_range(1,2)
		if gold == 1:
			%attack2.visible = true
		if gold == 2:
			%bublles2.visible = true
			
	%cube.frame = r1 - 1
	%cube2.frame = r2 - 1
	print(r1 + r2)


func _on_heart_pressed():
	
	Global.ply_max_health += 15
	get_tree().paused = false
	$item_choice.visible = false
	$Player.health += 10
func _on_foot_pressed():
	
	Global.ply_speed_boost += 30
	get_tree().paused = false
	$item_choice.visible = false
func _on_sab_pressed():
	
	Global.bullet_speed -= 0.03
	get_tree().paused = false 
	$item_choice.visible = false



func _on_heart_2_pressed():
	
	Global.ply_max_health += 15
	get_tree().paused = false
	$item_choice.visible = false
	$Player.health += 10
func _on_foot_2_pressed():
	
	Global.ply_speed_boost += 30
	get_tree().paused = false
	$item_choice.visible = false


func _on_sab_2_pressed():
	
	Global.bullet_speed -= 0.03
	get_tree().paused = false
	$item_choice.visible = false





func _on_attack_pressed():
	Global.ply_dmg += 0.5
	get_tree().paused = false
	$item_choice.visible = false


func _on_attack_2_pressed():
	Global.ply_dmg += 0.5
	get_tree().paused = false
	$item_choice.visible = false




func _on_texture_button_pressed():
	get_tree().quit()
	save()
	
	
	
	

func _on_load_pressed():
	
	load_data()
	

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	
	file.store_var(Global.X)
	file.store_var(Global.Y)
	file.store_var(Global.ply_speed_boost)
	file.store_var(Global.ply_dmg)
	file.store_var(Global.ply_max_health)
	file.store_var(Global.BOOST)
	file.store_var(Global.LVL)
	file.store_var(Global.bullet_speed)
	file.store_var(Global.bombe)
	file.store_var(Global.XP)
	
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		$Player.global_position.x = file.get_var(Global.X)
		$Player.global_position.y = file.get_var(Global.Y)
		
		Global.ply_speed_boost = file.get_var(Global.ply_speed_boost)
		Global.ply_dmg = file.get_var(Global.ply_dmg)
		Global.ply_max_health = file.get_var(Global.ply_max_health)
		Global.BOOST = file.get_var(Global.BOOST)
		Global.LVL = file.get_var(Global.LVL)
		Global.bullet_speed = file.get_var(Global.bullet_speed)
		Global.bombe = file.get_var(Global.bombe)
		Global.XP = file.get_var(Global.XP)
	else:
		print("No Data saved... (as :  + " + save_path + ")" )


func _on_light_toggled(toggled_on):
	pass # Replace with function body.


func _on_bublles_pressed():
	Global.bulle = true
	get_tree().paused = false
	$item_choice.visible = false

func _on_bublles_2_pressed():
	Global.bulle = true
	get_tree().paused = false
	$item_choice.visible = false
