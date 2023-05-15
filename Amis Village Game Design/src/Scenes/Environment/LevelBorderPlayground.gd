extends Area2D

func _on_LevelBorderPlayground_body_entered(_body):
# warning-ignore:return_value_discarded
	Globals.previous_level = get_parent().name
	get_tree().change_scene("res://src/Scenes/Environment/PlaygroundScene.tscn")
	
