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

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D2_body_entered(body):
	emit_signal("entered", water_name)
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	emit_signal("entered", water_name)
	pass # Replace with function body.


func _on_Area2D2_body_exited(body):
	emit_signal("exit")
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	emit_signal("exit")
	pass # Replace with function body.


func _on_Area2D3_entered(water_name):
	emit_signal("entered", water_name)
	pass # Replace with function body.


func _on_Area2D3_exit():
	emit_signal("exit")
	pass # Replace with function body.


func _on_Area2D3_body_entered(body):
	emit_signal("entered", water_name)
	pass # Replace with function body.


func _on_Area2D3_body_exited(body):
	emit_signal("exit")
	pass # Replace with function body.
