
extends Node



func _ready():
	# Set initial player position of the player same as the Position2D node
	if Globals.previous_level != null:
		$Player.set_position(get_node(Globals.previous_level + "Pos").position)
		

func _on_PauseButton_pressed():
	$GUILayer/PauseLayer.pause_game()
