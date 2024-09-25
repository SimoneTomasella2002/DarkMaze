extends Control

signal menu_closed

@onready var resume: Button = $MarginContainer/VBoxContainer/Resume

func _ready():
	resume.grab_focus()

func _on_resume_pressed():
	menu_closed.emit()

func _on_quit_pressed():
	get_tree().quit()

func _on_back_pressed():
	FadeTransition.load_scene("res://scenes/ui/menus/main_menu/main_menu.tscn")
