extends Control


# Declare member variables here. Examples:
var notPaused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if notPaused:
			get_tree().paused = true
			notPaused = false
			visible = true
		else:
			get_tree().paused = false
			notPaused = true
			visible = false


func _on_MainMenu_pressed():
	print("Button Pressed")
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/TitleScreen.tscn")
