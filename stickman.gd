extends Node2D

enum Anim {IDLE, RUN}
@onready var animation_player: AnimationPlayer = %AnimationPlayer

@export var animation : Anim

func _ready() -> void:
	match animation:
		Anim.IDLE:
			animation_player.play("idle")
		Anim.RUN:
			animation_player.play("run")
