extends Node2D

var ballMaxSpeed = get_node("res://MiniScenes/Ball.tscn").maxspeed setget set_ball_max_speed
var maxspeed = 2000
var score = 0 setget set_score
var life = 3 setget set_life
var current_ball_count = 0 setget set_current_ball_count

func set_ball_max_speed(maxspeed):
	if score >= 1000:
		ballMaxSpeed = maxspeed*1.25
	if score >= 2000:
		ballMaxSpeed = maxspeed*1.5
	
func set_score(value):
	score = value
	get_node("Score").set_text("SCORE: " + str(score))
	
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
