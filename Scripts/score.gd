extends Node

signal score_changed(new_score)
signal new_level(hidden_score)


var pack = preload("res://Scenes/LevelOne.tscn")
var inst = pack.instance()
var pack2 = preload("res://Scenes/LevelTwo.tscn")
var inst2 = pack2.instance()

var current_score = 0 setget set_score
var hidden_score = 0 setget set_hidden_score
var check1 = 0 # 1 if first game is chosen
var check2 = 0 # 1 if second game is chosen

func set_score(new_score):
	current_score = new_score
	emit_signal("score_changed", current_score)
	
func set_hidden_score(new_hidden_score):
	hidden_score = new_hidden_score
	emit_signal("new_level", hidden_score)
	if ((hidden_score % 90) == 0 && check1 == 1) && check2 == 0:
		inst.queue_free()
		inst = pack.instance()
		add_child(inst)
		get_tree().call_group("Bricks", "show")
		get_node("/root/World/BGM").stop()
	elif ((hidden_score % 90) == 0 && check2 == 1) && check1 == 0:
		inst2.queue_free()
		inst2 = pack2.instance()
		add_child(inst2)
		get_tree().call_group("Bricks", "show")
		get_node("/root/World/BGM").stop()
	else:
		pass
