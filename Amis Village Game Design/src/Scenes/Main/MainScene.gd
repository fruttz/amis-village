extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal open_inv

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if Input.is_action_just_released("ui_cancel"):
#		if $Pause.is_visible():
##			get_tree().paused = false
#			$Pause.hide()
#		else:
##			get_tree().paused = true
#			$Pause.show()
#
	if Input.is_action_just_released("inventory"):
		print("xdd")
		if $Node.is_visible():
#			get_tree().paused = false
			$Node.hide()
		else:
			emit_signal("open_inv")
#			get_tree().paused = true
			$Node.show()
	pass
