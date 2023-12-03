extends CharacterBody2D
@export var speed = 400
@export var rotation_speed = 1.5
var rotation_direction = 0

func _input(event):
	if event.is_action_pressed("move_left") or event.is_action_pressed("move_right") or event.is_action_pressed("move_up") or event.is_action_pressed("move_down"):
		rotation_direction = Input.get_axis("move_left", "move_right")
		velocity = transform.x * Input.get_axis("move_down", "move_up") * speed
func _physics_process(delta):
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
