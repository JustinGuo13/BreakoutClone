extends Label

func _ready():
	score.connect("score_changed", self, "_on_score_score_changed")

func _on_score_score_changed(new_score):
	text = ("SCORE: " + str(new_score))

