extends Node2D

var levelTarget = 0 # if levelTarget reaches 1, then reset level, keep score and make ball faster
var tempSpeed = 1000 # initialize tempSpeed
var maxspeed = 1000 # initial max speed of the ball
var cumulativeScore = 0
var score = 0 setget set_score
var life = 3 setget set_life
var current_ball_count = 0 setget set_current_ball_count
onready var ballScript = $"res://Scripts/Ball.gd"

func ready():
	ballScript.connect("brick_broken", self, "check_score")

func new_speed():
	tempSpeed = ballScript.maxspee
	ballScript.maxspeed = tempSpeed*1.25

func check_score():
	if score == (score % 9000 == 0):
		levelTarget += 1
		set_ball_max_speed()
		if levelTarget == 1:
			levelTarget -= 1
			get_tree().change_scene("res://LevelOne.tscn")
			print("success")

func set_ball_max_speed():
	if (score >= 9000) && (score % 9000 == 0):
		new_speed()

func get_score():
	return score

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
