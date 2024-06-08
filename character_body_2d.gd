extends CharacterBody2D
var health = 5
var speed = 65.0
@onready var player = get_node("/root/Map/Player")

func _ready():
	%slime.play("run")

func _physics_process(delta):
	look_at(player.global_position)
	var direction = self.global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
	
func take_damage(A):
	if A == true:
		health -= Global.ply_dmg
	if A == false:
		health -= 10
	%slime.play("Hurt")
	%slime.queue("run")
	
	if health < 1:
		queue_free()
		var chance = randi_range(0,2)
		
		if chance == 2:
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


func slow():
	%Slow.start(90)
	speed = 1.0

func _on_timer_timeout():
	speed = 65.0
