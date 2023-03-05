extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var fish_data

# Called when the node enters the scene tree for the first time.
func _ready():
	var f = File.new()
	f.open("res://src/Scenes/Environment/data/fishes.json", File.READ)
	var j = JSON.parse(f.get_as_text())
	
	f.close()
	fish_data = j.result
#	print(fish_data)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
