extends Area2D

@onready var gameManager: GameManager = %GameManager
@onready var pickupSFX: AudioStreamPlayer2D = $PickupSFX

func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("Player")):
		gameManager.addScore(1)
		pickupSFX.play()
		pickupSFX.get_parent().remove_child(pickupSFX)
		get_tree().get_root().add_child(pickupSFX)
		queue_free()
