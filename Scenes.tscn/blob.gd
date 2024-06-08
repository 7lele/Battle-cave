extends CharacterBody2D
var health = 13
@onready var player = get_node("/root/Map/Player")
var speed = 83.0
func _ready():
	%slime.play("run")

func _physics_process(delta):
	
	var direction = self.global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
	
func take_damage(A):
	if A == true:
		health -= Global.ply_dmg
	if A == false:
		health -= 8
	%slime.play("Hurt")
	%slime.queue("run")
	
	if health < 1:
		queue_free()
		var chance = randi_range(0,12)
		
		if chance < 12:
			const XP = preload("res://Scenes.tscn/gem.tscn")
			var new_xp = XP.instantiate()
			get_parent().get_parent().add_child(new_xp)
			new_xp.global_position = global_position
			new_xp.scale.x = 1
			new_xp.scale.y = 1
		elif chance == 12:
			const XP = preload("res://Scenes.tscn/bombe.tscn")
			var new_xp = XP.instantiate()
			get_parent().get_parent().add_child(new_xp)
			new_xp.global_position = global_position
			
		const SMOKE_SCENE = preload("res://Scenes.tscn/smoke.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position


func slow():
	%Slow.start(9)
	speed = 20

func _on_slow_timeout():
	speed = 83.0
