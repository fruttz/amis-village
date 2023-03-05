extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func parseData():
	var f = File.new()
	f.open("res://src/Scenes/Environment/data/fishes.json", File.READ)
	var j = JSON.parse(f.get_as_text())
	
	f.close()
	var data = j.result
	return data

func getFishList(waterName): # Iterate list of dict sampe nemu list of dict (ikan) yang sesuai sama waterName
	var fish_data = parseData()
	return fish_data[waterName]

func getFish(dict_list, id): # Sama kyk getFishes tapi buat list of dict ikan
	for i in range(dict_list.size()):
		if id in dict_list[i].values():
			return dict_list[i]

# --- GETTER ---

func getFishName(fish):
	return fish["fish_name"]

func getFishDesc(fish):
	return fish["desc"]

func getFishRar(fish):
	return fish["rarity"]

func getFishDiff(fish):
	return fish["difficulty"]

func getFishAff(fish):
	return fish["affection"]
