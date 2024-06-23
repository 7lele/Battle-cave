extends SubViewport
var MINIMAP:bool = false
@onready var cam = $Camera2D
@onready var player = $"../../../Player"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if MINIMAP == true:
		$"..".visible = true
	if MINIMAP == false:
		$"..".visible = false
	cam.position = player.position
	$Sprite2D3.position = player.position
	if Input.is_action_just_pressed("m") and MINIMAP == false:
		
		MINIMAP=true
	elif Input.is_action_just_pressed("m") and MINIMAP == true:
		MINIMAP=false
		
