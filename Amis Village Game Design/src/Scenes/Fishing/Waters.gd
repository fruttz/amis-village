extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var data = [
		{
			"waters_name":"Sungai",
			"fishes": [
				{
					"id": "01",
					"fish_name": "Kecebong",
					"desc": "Kecebong lucu",
					"rarity": 1,
					"difficulty": 1,
					"affection": 3
				},
				{
					"id": "02",
					"fish_name": "Kepiting",
					"desc": "Kepiting lucu",
					"rarity": 3,
					"difficulty": 4,
					"affection": 5
				},
				{
					"id": "03",
					"fish_name": "Arwana",
					"desc": "Arwana lucu",
					"rarity": 2,
					"difficulty": 2,
					"affection": 4
				},
				{
					"id": "04",
					"fish_name": "Kura-kura",
					"desc": "Kura-kura lucu",
					"name": "Kura-Kura",
					"rarity": 3,
					"difficulty": 2,
					"affection": 5
				},
			]
		},
		{
			"waters_name": "Danau",
			"fishes": [
				{
					"id": "01",
					"fish_name": "Kecebong",
					"desc": "Kecebong lucu",
					"rarity": 1,
					"difficulty": 1,
					"affection": 3
				},
				{
					"id": "02",
					"fish_name": "Kepiting",
					"desc": "Kepiting lucu",
					"rarity": 3,
					"difficulty": 4,
					"affection": 5
				},
				{
					"id": "03",
					"fish_name": "Arwana",
					"desc": "Arwana lucu",
					"rarity": 2,
					"difficulty": 2,
					"affection": 4
				},
				{
					"id": "04",
					"fish_name": "Kura-kura",
					"desc": "Kura-kura lucu",
					"name": "Kura-Kura",
					"rarity": 3,
					"difficulty": 2,
					"affection": 5
				},
			]
		},
		{
			"waters_name": "Laut",
			"fishes": [
				{
					"id": "01",
					"fish_name": "Tuna",
					"desc": "Tuna lucu",
					"rarity": 1,
					"difficulty": 1,
					"affection": 3
				},
				{
					"id":"02",
					"fish_name":"Gurita",
					"desc":"Gurita lucu",
					"rarity": 4,
					"difficulty": 5,
					"affection": 5
				},
				{
					"id":"03",
					"fish_name":"Kepiting",
					"desc": "Kepiting lucu",
					"rarity": 3,
					"difficulty": 4,
					"affection": 5
				},
			]
		},
	]

func getFishList(waterName): # Iterate list of dict sampe nemu list of dict (ikan) yang sesuai sama waterName
	for i in range(data.size()):
		if waterName in data[i].values():
			return data[i].values()[1]
		

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

	





