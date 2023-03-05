extends Node

var random = RandomNumberGenerator.new()

# Initialize fish
var fish_list = ImportData.getFishList("laut") #Ntar disesuaiin sama level
var fish = randomCatch()

func randomCatch():
	random.randomize()
	var current_fish
	var total_chance = 0
	for i in range(fish_list.size()):
		total_chance += fish_list[i]["rarity"]
	
	var random_number = random.randi_range(1, total_chance-1)
	var offset = 0
	
	for i in range(fish_list.size()):
		if random_number < fish_list[i]["rarity"] + offset:
			current_fish = fish_list[i]
			break
		else:
			offset += fish_list[i]["rarity"]
	
	return current_fish

func startCombat():
	$Combat.visible = true
	$Combat.startTimer()

func startPersuade():
	$Persuade.persuade()

func choice(param):
	match param:
		"combat":
			startCombat()
		"persuade":
			startPersuade()
		_:
			pass
		

func _ready():
	var dialog = Dialogic.start("initial_choice")
	var current_fish = Dialogic.set_variable("current_fish", fish["fish_name"])
	dialog.pause_mode = PAUSE_MODE_PROCESS
	dialog.connect("dialogic_signal", self, "choice")
	add_child(dialog)


