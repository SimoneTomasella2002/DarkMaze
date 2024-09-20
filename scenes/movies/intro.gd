extends Control

@onready var intro_text = $Background/IntroText
@onready var press_start_animation_player = $Background/StartPromptText/AnimationPlayer

func _ready() -> void:
	scroll_text()
	press_start_animation_player.play("fade-in_fade-out")

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("menu"):
		FadeTransition.load_scene("res://scenes/levels/level1.tscn")

func scroll_text() -> void:
	intro_text.visible_characters = 0
	var total_characters = intro_text.get_total_character_count()
	
	for i in range(total_characters):
		intro_text.visible_characters = i + 1
		await get_tree().create_timer(0.1).timeout
