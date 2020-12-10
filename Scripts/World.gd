extends Node2D

#var tempSpeed = 1000 # initialize tempSpeed
#var maxspeed = 1000 # initial max speed of the ball
var life = 3 setget set_life
var current_ball_count = 0 setget set_current_ball_count

#func new_speed():
#	tempSpeed = ballScript.maxspeed
#	ballScript.maxspeed = tempSpeed*1.25

#func set_ball_max_speed():
#	if (score >= 9000) && (score % 9000 == 0):
#		new_speed()

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
		yield(get_tree().create_timer(10), "timeout")
		score.current_score = 0
		score.hidden_score = 0
		get_tree().reload_current_scene()
		
#func _input(event):
#	if event is InputEventKey and event.pressed:
#		if event.scancode == KEY_R:
#			get_tree().reload_current_scene()
