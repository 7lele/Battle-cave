extends Control
var play
signal LVL_UP

# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.max_fps = 110
	play = get_node("/root/Map/Player")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
#region Item inventaire
	#montre si on a un item
	if Global.bombe == false:
		%Bombe.visible = false
	if Global.bombe == true:
		%Bombe.visible = true
	if Global.glue == false:
		%Glue.visible = false
	if Global.glue == true:
		%Glue.visible = true
	if Global.plume == false:
		%plume.visible = false
	if Global.plume == true:
		%plume.visible = true
#endregion
		
		
		
		
		
	%speedtxt.text = str(play.speed / 10)
	%speedtexte.text = str(Global.ply_dmg)
	%ProgressBar3.value = play.health
	%ProgressBar3.max_value = play.max_health
	%Label.text = str(round(play.health)) + " / " + str(play.max_health)
	$Label.text = str(Engine.get_frames_per_second())
	if Global.BOOST > 20:
		Global.BOOST = 20
	$ProgressBar.value = Global.XP
	if $ProgressBar.max_value == $ProgressBar.value:
		emit_signal("LVL_UP")
		$ProgressBar.value = 0
		Global.XP = 0
		$ProgressBar.max_value += 2 
		Global.LVL += 1
	$ProgressBar/Label.text = "LVL " + str(Global.LVL)
	$ProgressBar2.value = Global.BOOST
