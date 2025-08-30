extends CharacterBody2D

@export var SPEED: int = 500
@export var JUMP_VELOCITY: int = -450
@export var CAYOTE_TIME: float = 150

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var playerHealth: PlayerHealth = $PlayerHealth
@onready var jumpSFX: AudioStreamPlayer2D = $JumpSFX

var lastGroundedTime: int = 0
var isGrounded: bool = false

func CanJump() -> bool:
	return isGrounded || (Time.get_ticks_msec() - lastGroundedTime < CAYOTE_TIME)

func _physics_process(delta: float) -> void:
	# check if grounded
	isGrounded = is_on_floor()

	# Add the gravity.
	if not isGrounded:
		velocity += get_gravity() * delta
	# Set last ground time
	else:
		lastGroundedTime = Time.get_ticks_msec()

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and CanJump():
		velocity.y = JUMP_VELOCITY
		jumpSFX.play()

	# Get the input direction
	var direction: float = Input.get_axis("MoveLeft", "MoveRight")

	# Flip the sprite based on direction
	if (direction > 0):
		sprite.flip_h = false
	elif (direction < 0):
		sprite.flip_h = true
	
	# Apply animation
	if (playerHealth.playerHasDied):
		sprite.animation = "hit"
	elif (not isGrounded):
		sprite.animation = "jump"
	elif (abs(direction) > 0):
		sprite.animation = "run"
	else:
		sprite.animation = "idle"

	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
