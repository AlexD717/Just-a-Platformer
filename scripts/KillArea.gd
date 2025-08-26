extends Area2D

@export var doKillAnimation: bool = true

func _ready() -> void:
	body_entered.connect(bodyEntered)

func bodyEntered(body: Node2D) -> void:
	if (body.is_in_group("Player")):
		killBody(body)

func killBody(body: Node2D) -> void:
	if (!body): return
	# Calls playerDied() on the PlayerHealth node
	for child: Node in body.get_children():
		if (child is PlayerHealth):
			child.playerDied(doKillAnimation)
			return
