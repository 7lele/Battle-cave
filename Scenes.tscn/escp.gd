extends Node2D
@onready var light: CheckButton =$"../options/ColorRect/ScrollContainer/VBoxContainer/Light"
@onready var Gui: CheckButton =$"../options/ColorRect/ScrollContainer/VBoxContainer/Gui"
@onready var Lifebar: CheckButton =$"../options/ColorRect/ScrollContainer/VBoxContainer/Lifebar"
var esc = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	
	
	if $"../item_choice".visible == true:
		get_tree().paused = true
	if Input.is_action_just_pressed("echap") and esc == false:
		%pause.visible = true
		esc = true
		get_tree().paused = true
	elif Input.is_action_just_pressed("echap") and esc == true:
		%pause.visible = false
		$"../options".visible = false
		esc = false
		get_tree().paused = false


func _on_rest_pressed():
	%pause.visible = false
	esc = false
	get_tree().paused = false


func _on_option_pressed():
	%pause.visible = false
	$"../options".visible = true


func _on_back_pressed():
	%pause.visible = true
	$"../options".visible = false
	esc = true


func _on_gui_toggled(toggled_on):
	if toggled_on == false:
		$"../Gui/GUI".hide()
	else:
		
		$"../Gui/GUI".show()

func _on_light_toggled(toggled_on):
		
	if toggled_on == false:
		$"../Player/PointLight2D".hide()
		$"../WorldEnvironment".environment = Environment.new()
		Global.shaders = false
	else:
		
		$"../Player/PointLight2D".show()
		$"../WorldEnvironment".environment = preload("res://Shaders.tres")
		Global.shaders = true


func _on_lifebar_toggled(toggled_on):
		
	if toggled_on == false:
		
		Global.lifebar = false
		
	else:
		
		Global.lifebar = true
	
