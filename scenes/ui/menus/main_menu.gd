extends Control

@onready var start_game_button: Button = $MarginContainer/VBoxContainer/ButtonsVBox/StartGameButton
@onready var audioPlayer: AudioStreamPlayer = $AudioStreamPlayer

signal start_game()

func _ready():
	focus_button()

func _on_start_game_button_pressed() -> void:
	start_game.emit()
	hide()

func _on_credits_button_pressed() -> void:
	print("Palle")

func _on_exit_game_button_pressed() -> void:
	get_tree().quit()

func focus_button() -> void:
	start_game_button.grab_focus()
