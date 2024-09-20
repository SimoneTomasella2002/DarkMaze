extends Control

@onready var credits_text = $Background/RichTextLabel
@onready var press_start_animation_player = $Background/pressStartLabel/AnimationPlayer

func _ready() -> void:
	scroll_text()
	press_start_animation_player.play("fade-in_fade-out")

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("menu"):
		FadeTransition.load_scene("res://scenes/ui/menus/main_menu/main_menu.tscn")

func scroll_text() -> void:
	credits_text.visible_characters = 0
	var total_characters = credits_text.get_total_character_count()  # Ottiene il numero totale di caratteri
	
	for i in range(total_characters):  # Cicla attraverso il numero totale di caratteri
		credits_text.visible_characters = i + 1  # Aumenta il numero di caratteri visibili uno alla volta
		await get_tree().create_timer(0.1).timeout  # Aggiunge un ritardo di 0.1 secondi per ogni carattere
