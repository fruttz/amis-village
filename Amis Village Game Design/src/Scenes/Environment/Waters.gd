extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var all = [
	{
		"waters_name":"Sungai",
		"fishes": [
			{
				"id": "sungai_01",
				"fish_name": "Green Giant Carp",
				"desc": "Funny carp, please catch",
				"chance": 0.2
			},
			{
				"id": "sungai_02",
				"fish_name": "Crab",
				"desc": "Funny crab, please catch",
				"chance": 0.2
			},
			{
				"id": "sungai_03",
				"fish_name": "Fish",
				"desc": "Funny fish, please catch",
				"chance": 0.2
			},
			{
				"id": "sungai_04",
				"fish_name": "Name",
				"desc": "Funny name, please catch",
				"chance": 0.2
			},
			{
				"id": "sungai_05",
				"fish_name": "Teri",
				"desc": "Funny teri, please catch",
				"chance": 0.2
			}
		]
	},
	{
		"waters_name": "Laut",
		"fishes": [
			{
				"id": "laut_01",
				"fish_name": "Green Giant Carp",
				"desc": "Funny carp, please catch",
				"chance": 0.2
			},
			{
				"id":"laut_02",
				"fish_name":"Crab",
				"desc":"Funny crab, please catch",
				"chance":0.2
			},
			{
				"id":"laut_03",
				"fish_name":"Fish",
				"desc":"Funny fish, please catch",
				"chance":0.2
			},
			{
				"id":"laut_04",
				"fish_name":"Name",
				"desc":"Funny name, please catch",
				"chance":0.2
			},
			{
				"id":"laut_05",
				"fish_name":"Teri",
				"desc":"Funny teri, please catch",
				"chance":0.2
			}
		]
	},
	# lanjut lg
]

func getFishes(waterName):
	return all[waterName]["fishes"]
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
