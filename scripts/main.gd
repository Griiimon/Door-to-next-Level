extends Node2D

# file path of the first level
@export var initial_level: String

func _ready():
	# main scene is empty initially, so we have to switch
	# to the first level initially, first spawn position index
	change_level(initial_level, 0)

func change_level(new_scene_path: String, spawn_position_index: int):
	# check if there is already a level loaded
	# (will be the case unless we are loading the inital level)
	if Global.current_level:
		# and remove the currently loaded level
		Global.current_level.queue_free()
	
	Global.player_spawn_position_index= spawn_position_index
	# create and add the new level
	var new_level= load(new_scene_path).instantiate()
	add_child(new_level)
