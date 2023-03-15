extends Control

onready var current_fish = get_parent().fish
var window_tint = Color.red.lightened(0.2)

func catchWindow(x1, x2):
	if $CombatBar.value >= x1 and $CombatBar.value <= x2:
		return true

func catchDifficulty():
	var window1 
	var window2
	if current_fish["difficulty"] == 1:
		$Timer.set_wait_time(0.05)
		window1 = 40
		window2 = 90
	elif current_fish["difficulty"] == 2:
		$Timer.set_wait_time(0.04)
		window1 = 50
		window2 = 90
	elif current_fish["difficulty"] == 3:
		$Timer.set_wait_time(0.03)
		window1 = 60
		window2 = 90
	elif current_fish["difficulty"] == 4:
		$Timer.set_wait_time(0.02)
		window1 = 70
		window2 = 90
	elif current_fish["difficulty"] == 5:
		$Timer.set_wait_time(0.01)
		window1 = 80
		window2 = 90
			
	return [window1, window2]

func catchIndicator():
	$CombatBar.set_tint_progress(window_tint)
	
func catchSuccess():
	var dialog = Dialogic.start("catch_success")
	dialog.connect("dialogic_signal",self,"close")
	add_child(dialog)
	$Timer.stop()
	self.visible = false

func catchFailed():
	var dialog = Dialogic.start("catch_failed")
	dialog.connect("dialogic_signal",self,"close")
	add_child(dialog)
	$Timer.stop()
	self.visible = false
		

func _on_Timer_timeout(): #main function
	var windows = catchDifficulty()
	$CombatBar.value += 1
	if catchWindow(windows[0], windows[1]):
		catchIndicator()
	# Check timing
	if Input.is_action_pressed("game_action"): # game_action -> "E" key
		if catchWindow(windows[0], windows[1]):
			catchSuccess()
		else:
			catchFailed()
	# if button not pressed
	if $CombatBar.value == $CombatBar.max_value:
		catchFailed()
	

func startTimer():
	$Timer.start()

func close(param):
	if param == "close":
		get_tree().change_scene("res://src/Scenes/Environment/Waters Test.tscn")
