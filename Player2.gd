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
	rotation_direction = Input.get_axis("move_left2", "move_right2")
	velocity = transform.x * Input.get_axis("move_down2", "move_up2") * speed
	if Input.is_action_pressed("player2_shoot") && (!has_fired):
		fire()
		has_fired = true
		
func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	#var collision_info = move_and_collide(velocity * delta)
	#if collision_info:
		#queue_free()
	move_and_slide()
func _process(delta):
	if (has_fired):
		reload_timer -= delta
		if (reload_timer <= 0):
			reload_timer = RELOAD_TIME
			has_fired = false
