extends Control

@onready var intro_text = $Background/IntroText
@onready var press_start_prompt = $Background/StartPromptText
@onready var press_start_animation_player = $Background/StartPromptText/AnimationPlayer

var is_scrolling = true

func _ready() -> void:
	press_start_prompt.visible = false
	scroll_text()

func _input(_event: InputEvent) -> void:
	if (is_scrolling == true) and Input.is_action_just_pressed("menu"):
		show_press_button_prompt()
	elif Input.is_action_just_pressed("menu"):
		FadeTransition.load_scene("res://scenes/levels/level1.tscn")

func scroll_text() -> void:
	intro_text.visible_characters = 0
	var total_characters = intro_text.get_total_character_count()
	
	for i in range(total_characters):
		if (is_scrolling):
			intro_text.visible_characters = i + 1
			await get_tree().create_timer(0.1).timeout
		else:
			intro_text.visible_characters = total_characters
			break

func show_press_button_prompt() -> void:
	is_scrolling = false
	press_start_prompt.visible = true
	press_start_animation_player.play("fade-in_fade-out")
