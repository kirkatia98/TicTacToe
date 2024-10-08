extends Control
class_name HUD

@onready var grid = get_node("GamePanel/Grid")


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
