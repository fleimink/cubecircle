extends Node

@export var mob_scene : PackedScene
var score

func _ready():
	randomize()

func new_game():
	score = 0
	$StartTimer.start()
	$Player.start($StartPosition.position)
	$HUD.update_score(score)
	$HUD.show_message("Click on the button\n to change the direction of the ball")
	get_tree().call_group("mobs", "queue_free")

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	mob.position = Vector2(randf_range(0, 720), 0)
	var velocity = Vector2(0.5, 0.0)
	mob.linear_velocity = velocity.rotated(0)
	add_child(mob)
	
func _on_player_hit():
	$ScoreTimer.stop()
	$MobTimer.stop()
	#print("Yes")
	$HUD.show_game_over()
