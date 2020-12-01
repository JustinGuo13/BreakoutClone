extends Node2D

var ballMaxSpeed = 0
var maxspeed = 2000
var score = 0 setget set_score
var cumulativeScore = 0
var life = 3 setget set_life
var current_ball_count = 0 setget set_current_ball_count

func next_Level(score):
	if cumulativeScore == 1:
		cumulativeScore -= 1
		get_tree().change_scene("res://LevelOne-" + str(int(get_tree().current_scene.name) + 1) + ".tscn")
	
func set_ball_max_speed(maxspeed):
	if score >= 1000:
		ballMaxSpeed = maxspeed*1.25
	if score >= 2000:
		ballMaxSpeed = maxspeed*1.5
	
func set_score(value):
	score = value
	get_node("Score").set_text("SCORE: " + str(score))
	if score == 1000:
		cumulativeScore += 1
	
func set_life(value):
	life = value
	get_node("Life").set_text("LIFE: " + str(life))
	
func set_current_ball_count(value):
	current_ball_count = value
	
func game_over():
	if(life == 0):
		get_node("BGM").stop()
		get_node("GameOver").play()
		# Wait 10 seconds, then resume execution. 
#		yield(get_tree().create_timer(10), "timeout")
		get_tree().reload_current_scene()
		
#func _input(event):
#	if event is InputEventKey and event.pressed:
#		if event.scancode == KEY_R:
#			get_tree().reload_current_scene()
