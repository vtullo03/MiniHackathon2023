extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$TileMap/Circle/AnimationPlayer.play("shrink") # Replace with function body.
	$TileMap/Area2D/AnimationPlayer.play("safeAreaShrink")
