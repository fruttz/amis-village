extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var fish_name = "Blue Tang"
export var scale_to = 130

# Called when the node enters the scene tree for the first time.
func _ready():
	var sprite_name = "res://src/Assets/Fish/"+ fish_name +".png"
	print(sprite_name)
	self.texture = load(sprite_name)
	var data = load(sprite_name).get_data()
	
	self.rect_size.x = data.data["width"]
	self.rect_size.y = data.data["height"]
	
	var scale = scale_to / self.rect_size.x
	self.rect_scale.x = scale
	self.rect_scale.y = scale
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
