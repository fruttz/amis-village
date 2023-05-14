extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var npc_name = "pakle"

# Called when the node enters the scene tree for the first time.
func _ready():
	initNPC()

func initNPC():
	var sprite_name = "res://src/Assets/NPC/"+ npc_name +".png"
	$Sprite.texture = load(sprite_name)
	$Sprite.scale.x = 0.06
	$Sprite.scale.y = 0.06
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
