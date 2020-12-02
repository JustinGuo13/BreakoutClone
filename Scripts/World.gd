extends Node2D

var levelTarget = 0 # if levelTarget reaches 1, then reset level, keep score and make ball faster
#onready var ballMaxSpeed = get_node("res://MiniScenes/Ball.tscn").maxspeed # the ball's original max speed
var tempSpeed = 2000 # initialize tempSpeed
var maxspeed = 2000 # initial max speed of the ball
var cumulativeScore = 0
var score = 0 setget set_score
var life = 3 setget set_life
var current_ball_count = 0 setget set_current_ball_count

func new_speed():
	pass
	#tempSpeed = ballMaxSpeed
	#ballMaxSpeed = tempSpeed*1.25
	#load("res://MiniScenes/Ball.tscn").maxspeed = ballMaxSpeed

func set_ball_max_speed(_maxspeed):
	if score == (score % 9000 == 0):
		new_speed()

func set_score(value):
	score = value
	get_node("Score").set_text("SCORE: " + str(score))
	#if score == (score % 9000 == 0):
		#levelTarget += 1
		#if levelTarget == 1:
			#levelTarget -= 1
			#get_tree().change_scene("res://LevelOne.tscn")
		
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
