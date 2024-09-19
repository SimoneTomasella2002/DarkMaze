extends CharacterBody2D

# Const and variables
const SPEED = 300.0
const ACCEL = 2.0
const FRICTION = 100.0

var velocity: Vector2 = Vector2.ZERO

# Default functions

func _physics_process(delta: float) -> void:
	var playerInput = get_input()
	# velocity = lerp(velocity, playerInput * SPEED, delta * ACCEL)

	# Se c'è input del giocatore, muoviti verso il nuovo valore di velocità
	if playerInput != Vector2.ZERO:
		velocity = velocity.move_toward(playerInput * SPEED, ACCEL * delta)
	else:
		# Se non c'è input, applica attrito
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)

# Custom functions

func get_input() -> Vector2:
	var input = Vector2()
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	if input != Vector2.ZERO:
		return input.normalized()
	return Vector2.ZERO
