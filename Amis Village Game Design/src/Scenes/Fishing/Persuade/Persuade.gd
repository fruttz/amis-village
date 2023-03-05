extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal persuade_success(fish_name)

# Called when the node enters the scene tree for the first time.
func _ready():
	persuade()
	pass # Replace with function body.

#func _process(delta):
#	$Control/ProgressBar.value += 1
#	pass

func persuade():
	var dialog = Dialogic.start(get_parent().fish["fish_name"]+"_persuade")
#	var dialog = Dialogic.start("Kepiting_persuade")
	dialog.pause_mode = PAUSE_MODE_PROCESS
	dialog.connect("dialogic_signal",self,"result_fish")
	add_child(dialog)
# Called every frame. 'delta' is the elapsed time since the previous frame.


func result_fish(param):
	if param == "success":
		Inventory.updateAffection(get_parent().fish, 1)
	else:
		print("You failed to catch "+get_parent().fish["fish_name"])
	get_tree().change_scene("res://src/Scenes/Environment/Waters Test.tscn")
	pass
	
