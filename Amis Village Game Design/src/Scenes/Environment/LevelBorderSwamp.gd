extends Area2D

func _on_LevelBorderSwamp_body_entered(_body):
	GlobalPosition.previous_level = get_parent().name
	get_tree().change_scene("res://src/Scenes/Environment/SwampScene.tscn")
