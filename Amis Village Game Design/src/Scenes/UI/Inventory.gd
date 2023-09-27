extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var num_of_fish
var item = preload("InventoryItem.tscn")
var counts = preload("LabelCount.tscn")
signal close_inv
# Called when the node enters the scene tree for the first time.
func _ready():
	var fishes = Inventory.inventory
	var count = 0
	for i in fishes:
		print(i)
		count += 1
		print(i)
		var new_item = item.instance()
		new_item.set_name(i)
		new_item.scale_to = 150
		new_item.fish_name = i
		new_item.rect_position = get_node("Item"+str(count)).position
		add_child(new_item)
		
		var new_count = counts.instance()
		new_count.set_name("Count"+i)
		new_count.text = "x"+str(fishes[i])
		new_count.rect_position = get_node("Count"+str(count)).position
		add_child(new_count)
			
		
	pass # Replace with function body.

func refresh():
	print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
	var fishes = Inventory.inventory
	print(fishes)
	var count = 0
	for i in fishes:
		var count_node = get_node("Count"+i)
		count_node.text = "x"+str(fishes[i])
			
		
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("inventory"):
		print("a")
		get_tree().paused = false
		emit_signal("close_inv")
	pass



