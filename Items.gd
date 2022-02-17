extends TileMap
export(NodePath) var  playerPath
onready var player = get_node(playerPath)
var RANGE = 1

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mousePos = world_to_map(get_local_mouse_position())
	var selection =	highLightSelection(mousePos)
	if Input.is_action_just_pressed("LCLICK"):
		click(mousePos)
func click(var mousePos):
	pass
func highLightSelection(var mousePos):
	if abs(player.mapPos.x - mousePos.x) >RANGE or abs(player.mapPos.y - mousePos.y) > RANGE:
		$Panel.self_modulate = Color(0,0,0,0)
		return -1
		
	$Panel.set_position((map_to_world(mousePos)))
	
	if get_cellv(mousePos) == -1:
		$Panel.self_modulate = Color(0,0,0,0)
		return -1
	elif get_cellv(mousePos) == 0:
		$Panel.self_modulate = Color(0,1,0,0.5)
	elif get_cellv(mousePos) == 1:
		$Panel.self_modulate = Color(1,0.25,0,0.5)
	return get_cellv(mousePos)
