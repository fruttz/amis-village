extends Area2D

func _on_LevelBorderBeach_body_entered(body):
	GlobalPosition.previous_level = get_parent().name
	get_tree().change_scene("res://src/Scenes/Environment/BeachScene.tscn")
