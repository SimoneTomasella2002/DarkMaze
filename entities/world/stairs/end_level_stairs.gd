extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if(body.is_in_group("Player")):
		var level_number = str(get_tree().current_scene.name.to_int() + 1)
		FadeTransition.load_scene("res://scenes/levels/level" + level_number + ".tscn")
