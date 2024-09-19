extends CanvasLayer

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	color_rect.visible = false

func _process(delta: float) -> void:
	pass


func load_scene(next_scene:String) -> void:
	animation_player.play("fade")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(next_scene)
	animation_player.play_backwards("fade")

func reload_scene() -> void:
	animation_player.play("fade")
	await animation_player.animation_finished
	get_tree().reload_current_scene()
	animation_player.play_backwards("fade")
