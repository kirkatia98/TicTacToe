extends Object
class_name Game

#import shortcut
var Value: Dictionary = GameState.Value
var ValueText: Dictionary = GameState.ValueText

var NumRows: int = GameState.NumRows
var NumCols: int = GameState.NumCols
var WinLength: int = GameState.WinLength

# game state
var matrix : Array

# win checking data structures
var rows: Array
var cols: Array

var forward_diag : int
var backward_diag : int

func _init():
	matrix = []
	matrix.resize(NumRows)

	# initialize empty matrix
	for i in range(0, NumRows):
		matrix[i] = []
		matrix[i].resize(NumCols)

		for j in range(0, NumCols):
			matrix[i][j] = Value.CLEAR

	# initialize empty win arrays
	rows = []
	rows.resize(NumRows)
	for i in range(0, NumRows):
		rows[i] = 0

	cols = []
	cols.resize(NumCols)
	for j in range(0, NumCols):
		cols[j] = 0

	# assume square grid for now
	forward_diag = 0
	backward_diag = 0



func print_game():
	var matrix_str: String = ""

	for i in range(0, NumRows):
		for j in range(0, NumCols):
			var val : GameState.Value = matrix[i][j]
			var text : String =         ValueText[val]
			matrix_str += "| %s " % [text]
		matrix_str += "|\n"

	print(matrix_str)

func update_game(x: int, y: int, token: GameState.Value):
	matrix[y][x] = token

	rows[y] += token
	cols[x] += token

	# assume square grid
	if (y == x):
		forward_diag += token

	if (y == (NumRows - 1 - x)):
		backward_diag += token


func check_win() -> bool:
	var win: bool = false

	for i in range(0, NumRows):
		if(abs(rows[i]) == WinLength):
			win = true
			print("Win in row %d" % [i+1])

	for j in range(0, NumCols):
		if(abs(cols[j]) == WinLength):
			win = true
			print("Win in col %d" % [j+1])

	if(abs(forward_diag) == WinLength):
		win = true
		print("Win in forward diagnal")

	if(abs(backward_diag) == WinLength):
		win = true
		print("Win in backward diagnal")

	return win
