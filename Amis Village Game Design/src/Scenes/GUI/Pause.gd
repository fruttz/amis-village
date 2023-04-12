extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	$CenterContainer/VBoxContainer/Button.pressed.connect(self.unpause)
#	pass
	

func _on_Button_pressed():
	print('eeeeeeeeeeeeeeeeee')
	get_tree().paused = false
	pass # Replace with function body.
