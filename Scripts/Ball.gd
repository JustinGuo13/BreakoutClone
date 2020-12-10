extends RigidBody2D

export var speedup = 50
export var maxspeed = 1000
var bounce_count = 0;
signal destroy_brick

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("Bricks"):
			score.current_score += 100
			score.hidden_score += 1
			get_node("/root/World/BrickHit").play()
			body.hide()
			body.get_node("CollisionShape2D").disabled = true
		
		if body.get_name() == "Walls":
			get_node("/root/World/Walls/WallHit").play()
			
		if body.is_in_group("Paddle"):
			get_node("/root/World/Paddle/PaddleHit").play()
			var speed = get_linear_velocity().length()
			var direction = get_position() - body.get_node("Anchor").get_global_position()
			var velocity = direction.normalized() * min(speed + speedup, maxspeed)
			set_linear_velocity(velocity)
			print(str(speed+speedup))
			

func _on_VisibilityNotifier2D_screen_exited():
	get_node("/root/World").life -= 1
	get_node("/root/World").current_ball_count -= 1
	get_node("/root/World").game_over()
	
