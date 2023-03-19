extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var curr_fish

# Called when the node enters the scene tree for the first time.
func _ready():
	#persuade()
	pass # Replace with function body.

func persuade():
	curr_fish = get_parent().fish
	print(curr_fish["fish_name"]+"_persuade")
#	var dialog = Dialogic.start(curr_fish["fish_name"]+"_persuade")
#	var dialog = Dialogic.start(str(6 - ImportData.getFishAff(curr_fish) + Inventory.affection[ImportData.getFishName(curr_fish)])+"_persuade")
	var dialog = Dialogic.start(str("5_persuade"))
#	dialog.set
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
		Inventory.updateAffection(curr_fish, 1)
		
	get_tree().change_scene("res://src/Scenes/Environment/Waters Test.tscn")
	pass
