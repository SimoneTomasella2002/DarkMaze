extends RichTextLabel


func _ready() -> void:
	scroll_text(text)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("menu"):
		FadeTransition.load_scene("res://scenes/ui/menus/main_menu/main_menu.tscn")

func scroll_text(input_text:String) -> void:
	visible_characters = 0
	
	for i in get_parsed_text():
		visible_characters += 1
		await get_tree().create_timer(0.1).timeout
