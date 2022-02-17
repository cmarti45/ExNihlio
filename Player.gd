extends KinematicBody2D

export(NodePath) var landPath
onready var land : TileMap = get_node(landPath)
const SPEED = 2
var velocity :Vector2 = Vector2()
var mapPos : Vector2 = Vector2()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_D):
		velocity.x = lerp(velocity.x, SPEED, 0.2)
	elif Input.is_key_pressed(KEY_A):
		velocity.x = lerp(velocity.x, -SPEED, 0.2)
	else:
		velocity.x = lerp(velocity.x, 0, 0.2)
	if Input.is_key_pressed(KEY_S):
		velocity.y = lerp(velocity.y, SPEED, 0.2)
	elif Input.is_key_pressed(KEY_W):
		velocity.y = lerp(velocity.y, -SPEED, 0.2)
	else:
		velocity.y = lerp(velocity.y, 0, 0.2)
	move_and_collide(Vector2(velocity.x,0))
	if (land.get_cellv(land.world_to_map(position))) == -1:
		move_and_collide(Vector2(-velocity.x,0))
	move_and_collide(Vector2(0,velocity.y))
	if (land.get_cellv(land.world_to_map(position))) == -1:
		move_and_collide(Vector2(0,-velocity.y))
	mapPos = land.world_to_map(position)
	
