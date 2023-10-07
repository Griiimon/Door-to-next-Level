extends Area2D
class_name Door

# is this door a portal? to where?
@export var portal_to_next_level:= false
@export var portal_to_previous_level:= false



func _on_body_entered(_body):
	open_door()
	# tell the current level that this door has been opened
	Global.current_level.door_opened(self)

func open_door():
	# switch to opened door sprite
	$"Sprite Default".hide()
	$"Sprite Open".show()
