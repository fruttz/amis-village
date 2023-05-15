extends Node


func set_water_name(scene_name):
	match scene_name:
		"Beach1":
			return "laut"
		"Beach2":
			return "laut"
		"Beach3":
			return "laut"
		"AirBuntu":
			return "sungai"
		"Lake1":
			return "danau"
		"Lake2":
			return "danau"
		_:
			return "laut"
		
