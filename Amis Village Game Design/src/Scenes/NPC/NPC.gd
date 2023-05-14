extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var npc_name = "Mr. X"

# Called when the node enters the scene tree for the first time.
func _ready():
	initNPC()
	self.z_index = -1

func initNPC():
	var sprite_name = "res://src/Assets/NPC/"+ npc_name +"_sprite.png"
	$Sprite.texture = load(sprite_name)
	$Sprite.scale.x = 0.06
	$Sprite.scale.y = 0.06
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Back_body_entered(body):
	self.z_index = 1
	


func _on_Back_body_exited(body):
	self.z_index = -1
