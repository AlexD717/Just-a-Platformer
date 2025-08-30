extends Node
class_name GameManager


var score: int = 0
@export var label: Label
@export var winPanel: Panel
@export var winScore: Label

func _ready() -> void:
	winPanel.hide()

func addScore(points: int) -> void:
	score += points
	label.text = "Score: " + str(score)

func playerWon() -> void:
	label.hide()
	winPanel.show()
	winScore.text = "Coins Collected: " + str(score)
	get_tree().paused = true


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	print("Returning to main menu...")
	#get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
