extends Control

func _ready():
	$MODE.visible = false
	$PLAY.visible = true
	DiscordRPC.app_id = 1248310867951616161
	print("Discord working: " + str(DiscordRPC.get_is_discord_working()))
	# Set the first custom text row of the activity here
	DiscordRPC.details = "Beta fermée"
	# Set the second custom text row of the activity here
	DiscordRPC.state = "a atteint le niveau : " + str(Global.LVL)
	# Image key for small image from "Art Assets" from the Discord Developer website
	DiscordRPC.large_image = "battlecave_bi"
	# Tooltip text for the large image
	DiscordRPC.large_image_text = "jeu par 7léle"
	# Image key for large image from "Art Assets" from the Discord Developer website
	DiscordRPC.small_image = "battlecave_big"
	# Tooltip text for the small image
	DiscordRPC.small_image_text = "jeu par 7léle"
	# "02:41 elapsed" timestamp for the activity
	DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system())
 	# "59:59 remaining" timestamp for the activity
	DiscordRPC.refresh()
	# Always refresh after changing the values!
	

func _on_play_pressed():
	$MODE.visible = true
	$PLAY.visible = false


func _on_normal_pressed():
	get_tree().change_scene_to_file("res://Scenes.tscn/Map.tscn")


	 
