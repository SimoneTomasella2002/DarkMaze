extends Control

signal menu_closed

@onready var resume: Button = $MarginContainer/VBoxContainer/Resume

func _ready():
	self.position = get_viewport_rect().size/2
	resume.grab_focus()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("menu"):
		pass

func _on_resume_pressed():
	menu_closed.emit()

func _on_quit_pressed():
	get_tree().quit()

func _on_back_pressed():
	menu_closed.emit()
	FadeTransition.load_scene("res://scenes/ui/menus/main_menu/main_menu.tscn")
