extends Button

func _on_Button_pressed():
	score.check2 = 1
	get_tree().change_scene("res://Scenes/LevelTwo.tscn")
