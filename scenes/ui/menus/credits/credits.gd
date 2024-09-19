extends RichTextLabel


func _ready() -> void:
	scroll_text()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("menu"):
		FadeTransition.load_scene("res://scenes/ui/menus/main_menu/main_menu.tscn")

func scroll_text() -> void:
	visible_characters = 0
	var total_characters = get_total_character_count()  # Ottiene il numero totale di caratteri
	
	for i in range(total_characters):  # Cicla attraverso il numero totale di caratteri
		visible_characters = i + 1  # Aumenta il numero di caratteri visibili uno alla volta
		await get_tree().create_timer(0.1).timeout  # Aggiunge un ritardo di 0.1 secondi per ogni carattere
