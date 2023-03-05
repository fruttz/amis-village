extends KinematicBody2D

export var movementSpeed = 200
signal fish1
signal fish2
var velocity = Vector2()
var inProximity = ""

var currentFishes
var rng = RandomNumberGenerator.new()
var my_random_number

func invertProx(action, water_name):
	if action == "entered":
		inProximity = water_name
	elif action == "left":
		inProximity = ""
	print(inProximity)
		

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	velocity = velocity.normalized() * movementSpeed
	
	if Input.is_action_just_released("ui_accept") and inProximity:
	#		print(all[])
		get_tree().change_scene("res://src/Scenes/Fishing/FishingScene.tscn")
#		print("you acquired "+ inProximity +" fish")
	
	
	
		

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	


func _on_Area2D2_entered(water_name):
	invertProx("entered", water_name)
#	currentFishes = 
	print(water_name)
	pass # Replace with function body.


func _on_Area2D_entered(water_name):
	invertProx("entered", water_name)
	print(water_name)
	pass # Replace with function body.


func _on_Area2D2_exit():
	invertProx("left","")
	print("keluar")
	pass # Replace with function body.


func _on_Area2D_exit():
	invertProx("left","")
	print("keluar")
	pass # Replace with function body.


func _on_Area2D3_exit():
	invertProx("left","")
	print("keluar")
	pass # Replace with function body.


func _on_Area2D3_entered(water_name):
	invertProx("entered", water_name)
	print(water_name)
	pass # Replace with function body.
