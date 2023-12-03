extends Node2D

var bullet_speed = 325.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.x * bullet_speed * delta

func _on_body_entered(body):
	if body is TileMap:
		queue_free()
