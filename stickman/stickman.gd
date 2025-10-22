extends CharacterBody2D

enum Anim {IDLE, RUN, PUNCH}

@onready var head: Polygon2D = %Head
@onready var back_arm: Line2D = %BackArm
@onready var back_leg: Line2D = %BackLeg
@onready var torso: Line2D = %Torso
@onready var front_leg: Line2D = %FrontLeg
@onready var front_arm: Line2D = %FrontArm
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var display: Node2D = %display

@export var speed = 1200
@export var jump_speed = -1800
@export var gravity = 4000
@export var play_animation : Anim
@onready var animation_tree: AnimationTree = %AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
var direction = 1

func _ready() -> void:
	animation_tree.active = true
	_change_color()

func _physics_process(delta):
	move_and_slide()
	_change_direction()
	_animation()


func _change_direction():
	if velocity.x == 0: return
	var new_dir = sign(velocity.x)
	if new_dir != 0 and new_dir != direction:
		direction = new_dir
		display.scale.x = direction

func _animation():
	if velocity.y !=0:
		if velocity.y < 0:
			state_machine.travel('up')
		if velocity.y >= 0:
			state_machine.travel('down')
	else:
		if velocity.x != 0:
			state_machine.travel('run')
		else:
			state_machine.travel('idle')

@export var color = Color("White")

func _change_color():
	head.color = color
	torso.default_color = color
	var back_color = color.darkened(0.1)
	back_arm.default_color = back_color
	back_leg.default_color = back_color
	var front_color = color.lightened(0.1)
	front_leg.default_color = front_color
	front_arm.default_color = front_color

func _bert():
	pass
	match play_animation:
		Anim.IDLE:
			animation_player.play("idle")
		Anim.RUN:
			animation_player.play("run")
		Anim.PUNCH:
			animation_player.play("punch")
