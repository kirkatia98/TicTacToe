extends GridContainer
class_name Grid

#import shortcut
var Value: Dictionary = GameState.Value
var ValueText: Dictionary = GameState.Value

static var num_rows: int = 3
static var num_cols: int = 3


# Called when the node enters the scene tree for the first time.
func connect_callbacks(press_callback: Callable):

	for y in range(0, num_rows):
		for x in range(0, num_cols):

			var box : Box = get_child(x + y * num_rows)

			# Bind the button's pressed signal with this button's coords
			box.pressed.connect(press_callback.bind(x, y))

func clear_board():
	print("CLEAR BOARD")
	for box in get_children():
		box.set_value(Value.CLEAR)

func clear_cell(x, y):
	print("CLEAR < %d, %d >" % [x, y])

	var box: Box = get_child(x + num_rows * y)
	box.set_value(Value.CLEAR)


func set_cell(x, y, val: GameState.Value):
	print("SET < %d, %d >: %s" % [x, y, Value.find_key(val)])

	var box: Box = get_child(x + num_rows*y)
	box.set_value(val)


func get_cell(x, y) -> GameState.Value:
	var box: Box = get_child(x + num_rows * y)
	var val: GameState.Value = box.get_value()

	print("GET < %d, %d >: %s" % [x, y, Value.find_key(val)])
	return val


func unit_test():

	set_cell(1, 1, Value.O)
	set_cell(0, 2, Value.X)

	set_cell(2, 2, Value.O)
	set_cell(2, 2, Value.X)

	set_cell(1, 2, Value.O)
	clear_cell(1, 2)

	#Basic sets work
	assert(get_cell(0, 2) == Value.X)
	assert(get_cell(1, 1) == Value.O)

	#Unset tiles are still clear
	assert(get_cell(1, 2) == Value.CLEAR)

	#Overwrites work
	assert(get_cell(2, 2) == Value.X)

	#Clearing a value works
	assert(get_cell(1,2) == Value.CLEAR)
