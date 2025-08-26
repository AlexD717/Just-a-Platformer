extends Area2D

@export var killDelay: float = 0.5

func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("Player")):
		killBody(body)

func killBody(body: Node2D) -> void:
	if (!body): return
	await get_tree().create_timer(killDelay).timeout
	for child: Node in body.get_children():
		if (child is PlayerHealth):
			child.playerDied()
			return
