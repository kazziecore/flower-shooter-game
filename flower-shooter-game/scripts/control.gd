extends Control

@onready var score_label = $ScoreLabel

func _process(_delta):
	score_label.text = "Bugs Thwarted: " + str(GameManager.score)
