extends Area2D

@onready var gameManager: GameManager = %GameManager

func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("Player")):
		gameManager.addScore(1)
		queue_free()
