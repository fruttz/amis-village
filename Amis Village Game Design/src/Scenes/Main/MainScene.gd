extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal open_inv

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
