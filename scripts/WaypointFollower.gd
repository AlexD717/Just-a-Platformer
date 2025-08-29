extends Path2D

enum MovementMode { LOOP, STOP }

@export var speed: float = 100.0
@export var movement_mode: MovementMode = MovementMode.LOOP

@onready var follower: PathFollow2D = $PathFollow2D
var direction: int = 1

const THRESHOLD: float = 0.2

func _process(delta: float) -> void:
	if speed == 0:
		return

	follower.progress += direction * speed * delta
	var length: float = curve.get_baked_length()

	match movement_mode:
		MovementMode.LOOP:
			if follower.progress >= length - THRESHOLD:
				follower.progress = 0.0

		MovementMode.STOP:
			if follower.progress >= length - THRESHOLD:
				follower.progress = length
				speed = 0.0
			elif follower.progress <= THRESHOLD:
				follower.progress = 0.0
				speed = 0.0
