extends Node

var random = RandomNumberGenerator.new()
signal fishing_finished

# Initialize fish
onready var water_name = WaterNames.set_water_name(get_parent().name)
onready var fish_list = ImportData.getFishList(water_name) #Ntar disesuaiin sama level
onready var fish = randomCatch()

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


func start():
	get_tree().paused = true
	var dialog = Dialogic.start("initial_choice")
	var current_fish = Dialogic.set_variable("current_fish", fish["fish_name"])
	dialog.pause_mode = PAUSE_MODE_PROCESS
	dialog.connect("dialogic_signal", self, "choice")
	add_child(dialog)


# reset fish everytime combat or persuasion is finished
func _on_Combat_combat_finished():
	emit_signal("fishing_finished")
	fish = randomCatch()

func _on_Persuade_persuade_finished():
	emit_signal("fishing_finished")
	fish = randomCatch()

