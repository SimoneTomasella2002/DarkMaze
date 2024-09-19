extends CharacterBody2D

# Const and variables
const SPEED = 300.0
const ACCEL = 2.0
const FRICTION = 100.0

var input: Vector2.ZERO
var velocity: Vector2.ZERO

# Default functions

func _process(delta: float) -> void:
	var playerInput = get_input()
	// velocity = lerp(velocity, playerInput * SPEED, delta * ACCEL)

	if playerInput != Vector2.ZERO:
		velocity = velocity.move_toward(playerInput * SPEED, ACCEL * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)

	// move_and_slide()


# Custom functions

func get_input():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	return input.normalized()
