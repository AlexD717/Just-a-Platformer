extends Button

func _ready() -> void:
	pressed.connect(startGame)

func startGame() -> void:
	print("Game Started")
	get_tree().change_scene_to_file("res://scenes/game.tscn")