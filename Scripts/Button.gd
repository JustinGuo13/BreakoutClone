extends Button

func _on_Button_pressed():
	score.check1 = 1
	get_tree().change_scene("res://Scenes/LevelOne.tscn")
