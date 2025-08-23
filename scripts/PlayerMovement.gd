extends CharacterBody2D

@export var SPEED: int = 500
@export var JUMP_VELOCITY: int = -450
@export var CAYOTE_TIME: float = 150

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
	if Input.is_action_just_pressed("ui_accept") and CanJump():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction: float = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
