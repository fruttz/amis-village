extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal persuade_success(fish_name)

# Called when the node enters the scene tree for the first time.
func _ready():
	persuade()
	pass # Replace with function body.

func persuade():
#	print(PersuasionFish.curr_fish+"_persuade")
	var dialog = Dialogic.start(get_parent().fish["fish_name"]+"_persuade")
#	var dialog = Dialogic.start("Kepiting_persuade")
	dialog.pause_mode = PAUSE_MODE_PROCESS
#	var dialog = Dialogic.start("fish_01_persuade")
#	dialog.connect("timeline_end",self,"end_dialog")
	dialog.connect("dialogic_signal",self,"result_fish")
	add_child(dialog)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func result_fish(param):
	if param == "success":
		# increase fish function
		Inventory.updateAffection(get_parent().fish, 1)
#		print("Got "+get_parent().fish["fish_name"])
	else:
		print("You failed to catch "+get_parent().fish["fish_name"])
	get_tree().change_scene("res://src/Scenes/Environment/Waters Test.tscn")
	pass
