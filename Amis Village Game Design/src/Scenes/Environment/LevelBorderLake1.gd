extends Area2D

func _on_LevelBorderLake1_body_entered(_body):
	Globals.previous_level = get_parent().name
	get_tree().change_scene("res://src/Scenes/Environment/Lake1Scene.tscn")
