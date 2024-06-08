extends CharacterBody2D

@onready var player = get_node("/root/Map/Player")
var distance
var direction
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	distance = global_position.distance_to(player.global_position)
	direction = global_position.direction_to(player.global_position)
	velocity = round(direction) * (300.0 + (Global.ply_speed_boost / 29) )
	if distance < 100:
		move_and_slide()
	if distance < 9:
		queue_free()
		Global.XP += 1
	
