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


