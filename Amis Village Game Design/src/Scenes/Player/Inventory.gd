extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var affection = {}
var inventory # TBA

func _ready():
	var waters = ["sungai", "laut", "danau"]
	for i in waters:
		var fish_list = ImportData.getFishList(i)
		for j in fish_list:
			affection[j["fish_name"]] = 0
	print(affection)
	
func updateAffection(fish, change):
	affection[ImportData.getFishName(fish)] += change
	if affection[ImportData.getFishName(fish)] == ImportData.getFishAff(fish):
		# update inventory
		affection[ImportData.getFishName(fish)] = 0
		pass
	print(affection)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
