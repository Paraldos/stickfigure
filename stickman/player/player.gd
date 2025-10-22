extends "res://stickman/stickman.gd"

func _physics_process(delta):
	_move(delta)
	super(delta)

func _move(delta):
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
	velocity.x = Input.get_axis("left", "right") * speed
