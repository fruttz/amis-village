extends Area2D

signal entered(water_name)
signal exit
export var water_name = "Laut"
export var fish_data : Resource
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func fish():
	print(water_name + " Fish")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_body_entered(body):
	emit_signal("entered", water_name)
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	emit_signal("exit")
	pass # Replace with function body.
