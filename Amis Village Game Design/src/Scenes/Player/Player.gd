extends KinematicBody2D

export var movementSpeed = 200
export var fast_ms = 400
signal fish1
signal fish2
signal interaction_finished
var velocity = Vector2()
var move_input = Vector2()
var inProximity = ""

var currentFishes
var rng = RandomNumberGenerator.new()
var my_random_number
onready var NPC = get_parent().get_node("NPC")

func _ready():
	self.z_index = 1

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
	if Input.is_action_pressed("run"):
		velocity = velocity.normalized() * fast_ms
	else:
		velocity = velocity.normalized() * movementSpeed
	
	if Input.is_action_just_released("game_action") and inProximity:
	#		print(all[])
		if WaterNames.set_water_name(get_parent().name) == "laut":
			$PlayerSprite.visible = false
			$FishingSprite_Right.visible = true
			$FishingSprite_Right.playing = true
		else:
			$PlayerSprite.visible = false
			$FishingSprite_Left.visible = true
			$FishingSprite_Left.playing = true
		print("xdd")
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
		if Input.is_action_just_released("game_action") and collision.collider.name == "Front":
			if Interaction.NPC[NPC.npc_name] == 2:
				my_random_number = rng.randi_range(1,3)
				fish_choice()
			else:
				interact_NPC(Interaction.set_interaction_type(NPC.npc_name))
				if Interaction.NPC[NPC.npc_name] != 4:
					Interaction.NPC[NPC.npc_name] += 1
				
#		toggleInteractable(false)
	updateAnimation()

func interact_NPC(type):
	var dialog = Dialogic.start("NPC_"+ type + "/" + NPC.npc_name)
	dialog.pause_mode = PAUSE_MODE_PROCESS
	add_child(dialog)
	

func choice(param):
	if param == "check_yes":
		if check_inventory():
			interact_NPC("true")
			Inventory.inventory[NpcRequirement.requirement[NPC.npc_name]] = 0
			Interaction.NPC[NPC.npc_name] += 1
		else:
			var loop_value = Dialogic.set_variable("loop_value", my_random_number)
			interact_NPC("false")
	else:
		interact_NPC("greeting")

func fish_choice():
	var dialog = Dialogic.start("give_fish")
	dialog.pause_mode = PAUSE_MODE_PROCESS
	dialog.connect("dialogic_signal", self, "choice")
	add_child(dialog)

func check_inventory() -> bool:
	return Inventory.checkFish(NpcRequirement.requirement[NPC.npc_name])

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

func _on_Fishing_fishing_finished():
	$FishingSprite_Right.visible = false
	$FishingSprite_Right.playing = false
	$FishingSprite_Left.visible = false
	$FishingSprite_Left.playing = false
	$PlayerSprite.visible = true


func _on_WaterArea_entered(water_name):
	pass # Replace with function body.
