extends Control
class_name Board

#import shortcut
var Value: Dictionary = GameState.Value
var ValueText: Dictionary = GameState.ValueText

var NumRows: int = GameState.NumRows
var NumCols: int = GameState.NumCols

@onready var grid : GridContainer = $Grid

# Called when the node enters the scene tree for the first time.
func _ready():
	var press_callback : Callable = SM.move_update

	for y in range(0, NumRows):
		for x in range(0, NumCols):

			var box : Box = get_cell(x, y)

			# Bind the button's pressed signal with this button's coords
			box.pressed.connect(press_callback.bind(x, y))


func get_cell(x : int, y : int) -> Box:
	return grid.get_child(x + y * NumRows)

func update_cell(x : int, y : int, token : GameState.Value):
	var box : Box = get_cell(x, y)
	box.set_value(token)

func clear_grid():
	for box in grid.get_children():
		box.set_value(Value.CLEAR)
