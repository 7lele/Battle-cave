extends CharacterBody2D
var health = 30
@onready var player = get_node("/root/Map/Player")
var direction_al : Vector2
func _ready():
	%slime.play("run")

func _physics_process(delta):
	direction_al = player.global_position - global_position
	if direction_al.x > 0 :
		$AnimatedSprite2D.flip_h = true
		
	
	else:
		$AnimatedSprite2D.flip_h = false
	
	var direction = self.global_position.direction_to(player.global_position)
	velocity = direction * 80.0
	move_and_slide()
	
func take_damage(A):
	if A == true:
		health -= Global.ply_dmg
	if A == false:
		health -= 17
	%slime.play("Hurt")
	%slime.queue("run")
	
	if health < 1:
		queue_free()
		var chance = randi_range(0,6)
		
		if chance == 6:
			const XP = preload("res://plume.tscn")
			var new_xp = XP.instantiate()
			get_parent().get_parent().add_child(new_xp)
			new_xp.global_position = global_position
			new_xp.scale.x = 1
			new_xp.scale.y = 1
		if chance < 6:
			const XP = preload("res://Scenes.tscn/gem.tscn")
			var new_xp = XP.instantiate()
			get_parent().get_parent().add_child(new_xp)
			new_xp.global_position = global_position
			new_xp.scale.x = 1
			new_xp.scale.y = 1
		const SMOKE_SCENE = preload("res://Scenes.tscn/smoke.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
