extends Area2D
class_name Door

# target level file path 
@export var level_file_path: String
# target level spawn position index
@export var level_spawn_position_index: int


func _on_body_entered(_body):
	open_door()
	# tell the current level that this door has been opened
	Global.current_level.door_opened(self)

func open_door():
	# switch to opened door sprite
	$"Sprite Default".hide()
	$"Sprite Open".show()
