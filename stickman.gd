extends Node2D

enum Anim {IDLE, RUN, PUNCH}
@onready var animation_player: AnimationPlayer = %AnimationPlayer

@export var play_animation : Anim

func _ready() -> void:
	match play_animation:
		Anim.IDLE:
			animation_player.play("idle")
		Anim.RUN:
			animation_player.play("run")
		Anim.PUNCH:
			animation_player.play("punch")
