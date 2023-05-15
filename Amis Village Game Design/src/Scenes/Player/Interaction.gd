extends Node

var NPC = {
	"Pak RT": 4,
	"Bu RT" : 0,
	"Pak Le": 0,
	"Budi": 0,
	"Siska": 0,
	"Tengil1": 0,
	"Mr. X": 4
}

func set_interaction_type(NPC_name):
	var type
	
	if NPC[NPC_name] == 0:
		type = "greeting"
	elif NPC[NPC_name] == 1:
		type = "quest"
	elif NPC[NPC_name] == 2:
		type = "loop"
	elif NPC[NPC_name] == 3:
		type = "reward"
	elif NPC[NPC_name] == 4:
		type = "greeting"
		
	return type

