extends CharacterBody2D

# Const and variables
const SPEED = 300.0
const ACCEL = 2.0

var input: Vector2


# Default functions

func _process(delta: float) -> void:
	var playerInput = get_input()
	velocity = lerp(velocity, playerInput * SPEED, delta * ACCEL)
	
	move_and_slide()


# Custom functions

func get_input():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	return input.normalized()
