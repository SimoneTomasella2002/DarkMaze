extends Node

var pause_menu = load("res://scenes/ui/menus/pause_menu/pause_menu.tscn")
var _pause_scene = null

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("menu"):
		var scene_path = get_tree().get_first_node_in_group("levels")
		if scene_path != null:
			_pause_scene = pause_menu.instantiate()
			_pause_scene.menu_closed.connect(_on_menu_closed)
			get_tree().root.add_child(_pause_scene)
			get_tree().paused = true

func _on_menu_closed():
	_pause_scene.queue_free()
	get_tree().paused = false
