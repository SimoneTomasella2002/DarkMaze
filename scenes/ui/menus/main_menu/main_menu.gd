extends Control

@onready var start_game_button: Button = $MarginContainer/VBoxContainer/ButtonsVBox/StartGameButton
@onready var audioPlayer: AudioStreamPlayer = $AudioStreamPlayer


signal start_game()

func _ready():
	focus_button()

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("menu"):
		get_tree().quit()

func _on_start_game_button_pressed() -> void:
	start_game.emit()
	FadeTransition.load_scene("res://scenes/movies/intro.tscn")

func _on_debug_room_button_pressed() -> void:
	FadeTransition.load_scene("res://scenes/levels/debug_room.tscn")

func _on_credits_button_pressed() -> void:
	FadeTransition.load_scene("res://scenes/ui/menus/credits/credits.tscn")

func _on_exit_game_button_pressed() -> void:
	get_tree().quit()



func focus_button() -> void:
	start_game_button.grab_focus()
