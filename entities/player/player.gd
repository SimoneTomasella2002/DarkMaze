extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

# Const and variables
const SPEED = 250.0
const ACCEL = 2.0
const FRICTION = 0.1

var is_moving: bool = false
var last_movement: String = "idle_left_right"

# Default functions
func _ready():
	anim.play("idle_left_right")

# Beta version of movements, must be improved on
func _physics_process(delta: float) -> void:
	var playerInput = get_input()
	
	if (playerInput.length() > 0):
		velocity = velocity.lerp(playerInput * SPEED, delta * ACCEL)
	else:
		velocity = velocity.lerp(Vector2.ZERO, FRICTION)
	
	playAnimation(playerInput)
	
	move_and_slide()

# Custom functions

func get_input() -> Vector2:
	var input = Vector2()
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	return input.normalized() if input != Vector2.ZERO else Vector2.ZERO


func playAnimation(playerInput: Vector2):
	if playerInput.x < 0:
		anim.flip_h = true
	elif playerInput.x > 0:
		anim.flip_h = false
	
	if playerInput == Vector2.ZERO:
		if last_movement == "walking_left_right":
			anim.play("idle_left_right")
		elif last_movement == "walking_up":
			anim.play("idle_up")
		else:
			anim.play("idle_down")
	else:
		if abs(playerInput.x) > abs(playerInput.y):
			anim.play("walking_left_right")
			last_movement = "walking_left_right"
		elif playerInput.y < 0:
			anim.play("walking_up")
			last_movement = "walking_up"
		else:
			anim.play("walking_down")
			last_movement = "walking_down"
