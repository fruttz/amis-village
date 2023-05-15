extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	get_tree().paused = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartBtn_button_up():
	$AnimationPlayer.play("New Anim")

	get_tree().paused = false
	pass # Replace with function body.


func _on_QuitBtn_button_up():
	get_tree().quit()
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	self.visible = false
	pass # Replace with function body.
