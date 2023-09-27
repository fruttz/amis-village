extends Node2D




func _on_InventoryButton_pressed():
	if $Inventory.visible == false:
		$Map.hide()
		$Inventory.show()

func _on_MapButton_pressed():
	if $Map.visible == false:
		$Inventory.hide()
		$Map.show()


func _on_BackButton_pressed():
	self.visible = false
	
func _on_Player_open_inv():
	$Inventory.refresh()
	pass # Replace with function body.


func _on_PauseLayer_open_inv():
	$Inventory.refresh()
	pass # Replace with function body.
