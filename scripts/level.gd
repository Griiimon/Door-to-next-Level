extends Node2D
class_name Level

# file path to next and previous level
@export var next_level_path: String
@export var previous_level_path: String


@onready var PlayerScene= preload("res://player.tscn")

func _init():
	# register this level as current_level as soon as it is
	# instantiated
	Global.current_level= self

func _ready():
	# when this level is ready we create and add the player 
	var player= PlayerScene.instantiate()
	# and move it to the given spawn position
	player.position= $"Spawn Position".position
	add_child(player)


func door_opened(door: Door):
	# wait 1 second, so player sees the opened door
	await get_tree().create_timer(1).timeout
	
	# we know we are always a direct child of Main
	# so we can call get_parent().change_level()
	# like this and it can't fail
	
	if door.portal_to_next_level:
		get_parent().change_level(next_level_path)
	elif door.portal_to_previous_level:
		get_parent().change_level(previous_level_path)
	
