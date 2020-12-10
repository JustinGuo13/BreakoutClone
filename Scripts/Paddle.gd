extends KinematicBody2D

var ball_scene = preload("res://MiniScenes/Ball.tscn")
var ball = ball_scene.instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	set_process_input(true)
	score.connect("new_level", self, "remove_ball")
	
func _physics_process(_delta):
	var y = get_position().y
	var mouse_x = get_viewport().get_mouse_position().x
	set_position(Vector2(mouse_x, y))

func _input(_event):
	if Input.is_action_just_pressed("left click") && get_node("/root/World").current_ball_count == 0:
		var ball = ball_scene.instance()
		get_tree().get_root().add_child(ball)
		ball.set_position(get_position() - Vector2(0, 16))
		get_node("/root/World").current_ball_count += 1

func remove_ball(_event):
	if ((score.hidden_score % 90) == 0):
		yield(get_tree().create_timer(.00000001), "timeout")
		ball.set_position(get_position() - Vector2(0, 16))
