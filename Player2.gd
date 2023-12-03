extends CharacterBody2D
@export var speed = 400
@export var rotation_speed = 1.5
var rotation_direction = 0

func _input(event):
	if event.is_action_pressed("move_left2") or event.is_action_pressed("move_right2") or event.is_action_pressed("move_up2") or event.is_action_pressed("move_down2"):
		rotation_direction = Input.get_axis("move_left2", "move_right2")
		velocity = transform.x * Input.get_axis("move_down2", "move_up2") * speed
func _physics_process(delta):
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
