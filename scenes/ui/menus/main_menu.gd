extends Control

@onready var buttons_v_box: VBoxContainer = $MarginContainer/VBoxContainer/ButtonsVBox
signal start_game()

func _ready():
	focus_button()

func _on_start_game_button_pressed() -> void:
	start_game.emit()
	hide()

func _on_exit_game_button_pressed() -> void:
	get_tree().quit()

func focus_button() -> void:
	if buttons_v_box:
		var button: Button = buttons_v_box.get_child(0)
		if button is Button:
			button.grab_focus()
