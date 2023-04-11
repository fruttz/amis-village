extends Node

func _ready():
	# Set initial player position of the player same as the Position2D node
	if GlobalPosition.previous_level != null:
		$Player.set_position(get_node(GlobalPosition.previous_level + "Pos").position)
