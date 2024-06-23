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
	velocity = round(direction) * 500.0
	if distance < 75 and Global.bombe == false and Global.glue == false and Global.plume == false:
		move_and_slide()
	if distance < 9  and Global.bombe == false and Global.glue == false and Global.plume == false:
		queue_free()
		Global.glue = true
