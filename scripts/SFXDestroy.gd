extends AudioStreamPlayer2D

func _ready() -> void:
	finished.connect(onFinished)

func onFinished() -> void:
	queue_free()
