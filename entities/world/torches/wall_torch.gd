extends StaticBody2D

class_name Wall_Torch

@export var anim : AnimatedSprite2D 
@export var area : Area2D
@export var prompt_text : Label
@export var light : Light2D
@export var particles : CPUParticles2D

var enlightened : bool = false
var is_player_in_area : bool = false

func _ready() -> void:
	anim.play("unlit")
	prompt_text.visible = false
	light.visible = false

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		if is_player_in_area and !enlightened:
			anim.play("lit")
			enlightened = true
			light.visible = true
			prompt_text.visible = false
			particles.emitting = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and !enlightened:
		is_player_in_area = true
		prompt_text.visible = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player") and !enlightened:
		is_player_in_area = false
		prompt_text.visible = false
