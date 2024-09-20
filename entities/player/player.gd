extends CharacterBody2D

# Const and variables
const SPEED = 300.0
const ACCEL = 2.0
const FRICTION = 100.0

# Default functions

# Beta version of movements, must be improved on
func _physics_process(delta: float) -> void:
	var playerInput = get_input()
	velocity = lerp(velocity, playerInput * SPEED, delta * ACCEL)
	
	move_and_slide()

# Custom functions

func get_input() -> Vector2:
	var input = Vector2()
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	if input != Vector2.ZERO:
		return input.normalized()
	return Vector2.ZERO
