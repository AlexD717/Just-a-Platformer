extends Node2D
class_name PlayerHealth

func playerDied() -> void:
    print("Player has died.")
    # get_parent().queue_free() # This will remove the player from the scene
    get_tree().reload_current_scene()
