extends CharacterBody2D

@export var speed= 200


func _physics_process(_delta):
	var movement= Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity= movement * speed
	
	move_and_slide()
