extends Node
class_name GameManager


var score: int = 0
@export var label: Label

func addScore(points: int) -> void:
	score += points
	label.text = "Score: " + str(score)
