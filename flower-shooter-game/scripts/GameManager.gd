extends Node

var score: int = 0

func add_score(points: int = 1):
	score += points
	print("Score:", score)  # Debugging, replace with UI update later

func reset_score():
	score = 0
