extends Control
class_name HUD

@onready var grid = $GamePanel/Grid
@onready var p1 = $Player1
@onready var p2 = $Player2

func _ready():
	p1.label.text = "player 1"
	p2.label.text = "player 2"

func set_player(player = 0):
	p1.set_turn(player == 1)
	p2.set_turn(player == 2)


func get_player() -> int:
	if p1.get_turn():
		return 1
	if p2.get_turn():
		return 2
	return 0

func clear_board():
	print("CLEAR BOARD")
	for box in grid.get_children():
		box.select(Board.Value.CLEAR)


func clear_value(x, y):
	print("CLEAR < %d, %d >" % [x, y])

	var box = grid.get_child(x + 3*y)
	box.select(Board.Value.CLEAR)


func set_value(x, y, value: Board.Value):
	print("SET < %d, %d >: %s" % [x, y, Board.Value.find_key(value)])

	var box = grid.get_child(x + 3*y)
	box.select(value)


func get_value(x, y) -> Board.Value:
	var box = grid.get_child(x + 3*y)
	var value = box.get_selected_id()

	print("GET < %d, %d >: %s" % [x, y, Board.Value.find_key(value)])
	return value
