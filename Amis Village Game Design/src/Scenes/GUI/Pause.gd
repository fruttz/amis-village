extends PanelContainer


signal open_inv
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("ui_cancel"):
		pause_game()
		
#		
func pause_game():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	self.visible = new_pause_state

func _on_Button_pressed():
	get_tree().paused = false
	self.visible = false
	


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_ControlButton_pressed():
	$CenterContainer/Menu.visible = false
	$CenterContainer/Controls.visible = true
	

func _on_BackButton_pressed():
	$CenterContainer/Controls.visible = false
	$CenterContainer/Menu.visible = true


func _on_InventoryButton_pressed():
	get_parent().get_node("Node2").visible = true
	emit_signal("open_inv") 
