extends KinematicBody2D

export var movementSpeed = 200
signal fish1
signal fish2
var velocity = Vector2()
var move_input = Vector2()
var inProximity = ""

var currentFishes
var rng = RandomNumberGenerator.new()
var my_random_number

func invertProx(action, water_name):
	if action == "entered":
		inProximity = water_name
	elif action == "left":
		inProximity = ""
		

func getInput():
	velocity = Vector2.ZERO
	move_input = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1.0
		move_input.x -= 1.0
	if Input.is_action_pressed("move_right"):
		velocity.x += 1.0
		move_input.x += 1.0
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1.0
		move_input.y -= 1.0
	if Input.is_action_pressed("move_down"):
		velocity.y += 1.0
		move_input.y += 1.0
	velocity = velocity.normalized() * movementSpeed
	
	if Input.is_action_just_released("game_action") and inProximity:
	#		print(all[])
		$"../Fishing".start()
		$PlayerUI.hide()
		
#		print("you acquired "+ inProximity +" fish")
	if Input.is_action_just_released("ui_cancel"):
		if not $"../Pause".is_visible():
#			get_tree().paused = true
#			$"../Pause".pause()
			print("asa")
			$"../Pause".show()
		else:
			$"../Pause".hide()
#			get_tree().paused = false

func updateAnimation():
	if move_input == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idle")
	else:
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Idle/blend_position", move_input)
		$AnimationTree.set("parameters/Walk/blend_position", move_input)

func _physics_process(delta):
	getInput()
#	if inProximity:
#		toggleInteractable(true)
	velocity = move_and_slide(velocity, Vector2(0,0), true, 1)
	for i in get_slide_count():
#		toggleInteractable(true)
		var collision = get_slide_collision(i)
		if Input.is_action_just_released("game_action") and collision.collider.name == "NPC":
			print(collision.collider.npc_name)
			var dialog = Dialogic.start("NPC/"+collision.collider.npc_name)
			dialog.pause_mode = PAUSE_MODE_PROCESS
			add_child(dialog)
#		toggleInteractable(false)
	updateAnimation()


func _on_Area2D2_entered(water_name):
	invertProx("entered", water_name)
#	currentFishes = 
	print(water_name)
	pass # Replace with function body.
	
func _on_Area2D_entered(water_name):
	invertProx("entered", water_name)
	$PlayerUI.show()
	pass # Replace with function body.


func _on_Area2D_exit():
	invertProx("left","")
	$PlayerUI.hide()
	pass # Replace with function body.

func _on_Area2D3_entered(water_name):
	invertProx("entered", water_name)
	print(water_name)
	pass # Replace with function body.

func _on_NPC_body_entered(body):
	print("check")
	pass # Replace with function body.
