class_name Save
extends Resource

const SAVE_GAME_PATH := "res://save.tres"


var player_pos = Global.playpos 



func write_save() -> void: 
	ResourceSaver.save(self, SAVE_GAME_PATH )
	

static func load_save() -> Resource:
	if ResourceLoader.exists(SAVE_GAME_PATH):
		return load(SAVE_GAME_PATH)
	return null
