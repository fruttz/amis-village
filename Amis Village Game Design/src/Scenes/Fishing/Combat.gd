extends Control

var fish_list = Waters.getFishList("Sungai") #Ntar disesuaiin sama level
var fish = Waters.getFish(fish_list, "02") #Ntar disesuaiin sama random chance

func catchWindow(x1, x2):
	if $CombatBar.value >= x1 and $CombatBar.value <= x2:
		return true

func catchDifficulty():
	var window1 
	var window2
	match Waters.getFishDiff(fish):
		1:
			window1 = 40
			window2 = 90
		2:
			window1 = 50
			window2 = 90
		3:
			window1 = 60
			window2 = 90
		4:
			window1 = 70
			window2 = 90
		5:
			window1 = 80
			window2 = 90
		_:
			pass
			
	return [window1, window2]

func catchIndicator():
	print("Catch") 
	
func catchSuccess():
	print("Catch Success")
	$Timer.stop()

func catchFailed():
	print("Catch Failed")
	$Timer.stop()
		

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

			
