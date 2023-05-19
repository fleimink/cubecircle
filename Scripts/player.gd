extends CharacterBody2D

signal hit

var speed = 250
var move = 1
var x = 0

func _ready():
	hide()

func _physics_process(delta):
	velocity = Vector2()
	match move:
		1:
			velocity = Vector2(speed, 0)
		2:
			velocity = Vector2(-speed, 0)
	move_and_slide()


func _on_texture_button_pressed():
	if move == 1:
		move = 2
	elif move == 2:
		move = 1

func _on_area_2d_body_entered(body):
	#x += 1
	#if x >= 2:
	hide()
	hit.emit()
		
func start(pos):
	position = pos
	show()
