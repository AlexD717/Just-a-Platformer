extends Node2D
class_name PlayerHealth

@export var killDelay: float = 2
@export var upwardForceOnDeath: float = 500

var playerHasDied: bool = false

func playerDied(doKillAnimation: bool) -> void:
	if (playerHasDied): return
	print("Player has died.")
	playerHasDied = true
	if (doKillAnimation):
		var parentBody: CharacterBody2D = get_parent()
		parentBody.get_node("CollisionShape2D").call_deferred("queue_free")
		var animatedSprite: AnimatedSprite2D = parentBody.get_node("AnimatedSprite2D")
		animatedSprite.z_index = 100
		animatedSprite.modulate.a = 0.5
		parentBody.velocity.y = -upwardForceOnDeath
		await get_tree().create_timer(killDelay).timeout
	# get_parent().queue_free() # This will remove the player from the scene
	get_tree().reload_current_scene()
