extends CanvasLayer

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	color_rect.visible = false

func load_scene(next_scene:String) -> void:
	animation_player.play("fade")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(next_scene)
	animation_player.play_backwards("fade")
	await animation_player.animation_finished
	color_rect.hide()

func reload_scene() -> void:
	animation_player.play("fade")
	await animation_player.animation_finished
	get_tree().reload_current_scene()
	animation_player.play_backwards("fade")
	await animation_player.animation_finished
	color_rect.hide()
