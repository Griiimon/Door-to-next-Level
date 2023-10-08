extends Node2D
class_name Level

@onready var PlayerScene= preload("res://player.tscn")

@onready var spawn_positions = $"Spawn Positions"


func _init():
	# register this level as current_level as soon as it is
	# instantiated
	Global.current_level= self

func _ready():
	# when this level is ready we create and add the player 
	var player= PlayerScene.instantiate()
	# and move it to the given spawn position
	# by picking one of the children
	# of the Node "Spawn Positions", via index
	
	var spawn_node: Node2D= spawn_positions.get_child(Global.player_spawn_position_index)
	
	player.position= spawn_node.position
	add_child(player)


func door_opened(door: Door):
	# wait 1 second, so player sees the opened door
	await get_tree().create_timer(1).timeout
	
	# we know we are always a direct child of Main
	# so we can call get_parent().change_level()
	# like this and it can't fail
	
	get_parent().change_level(door.level_file_path, door.level_spawn_position_index)
