extends CharacterBody2D

@export var speed = 400
@export var rotation_speed = 1.5
var rotation_direction = 0

# bullet variables
var bullet_object = preload("res://Bullet.tscn")
var RELOAD_TIME = 1.0
var reload_timer = RELOAD_TIME
var has_fired = false

func fire():
	var bullet = bullet_object.instantiate()
	bullet.position = position
	bullet.rotation = rotation
	get_tree().get_root().add_child.call_deferred(bullet)

func get_input():
	rotation_direction = Input.get_axis("move_left", "move_right")
	velocity = transform.x * Input.get_axis("move_down", "move_up") * speed
	if Input.is_action_pressed("player1_shoot") && (!has_fired):
		fire()
		has_fired = true
		
func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()

func _process(delta):
	if (has_fired):
		reload_timer -= delta
		if (reload_timer <= 0):
			reload_timer = RELOAD_TIME
			has_fired = false
