extends Object
class_name Game

#import shortcut
var Value: Dictionary = GameState.Value
var ValueText: Dictionary = GameState.ValueText

var NumRows: int = GameState.NumRows
var NumCols: int = GameState.NumCols

var M : Array

func _init():
	M = []
	M.resize(NumRows)

	for i in range(0, NumRows):
		M[i] = []
		M[i].resize(NumCols)

		for j in range(0, NumCols):
			M[i][j] = Value.CLEAR

func matrix() -> Array:
	return M

func print_matrix():
	var matrix_str: String = ""

	for i in range(0, NumRows):
		for j in range(0, NumCols):
			var val : GameState.Value = M[i][j]
			var text : String =         ValueText[val]
			matrix_str += "| %s " % [text]
		matrix_str += "|\n"

	print(matrix_str)


func check_win() -> bool:
	var final_win : bool = false

	# rows
	for i in range(0, NumRows):
		var win : bool = true
		var val : GameState.Value = M[i][0]
		if (val == Value.CLEAR):
			break

		for j in range(1, NumCols):
			win = win and val == M[i][j]

		if win:
			final_win = final_win or win
			print("Win in row %d" % [i])

	# columns
	for j in range(0, NumCols):
		var win : bool = true
		var val : GameState.Value = M[0][j]
		if (val == Value.CLEAR):
			break

		for i in range(1, NumRows):
			win = win and val == M[i][j]

		if win:
			final_win = final_win or win
			print("Win in column %d" % [j])

	# diagnals
	var val1 : GameState.Value = M[0][0]
	var val2 : GameState.Value = M[0][NumRows - 1]

	var win1: bool = true
	var win2: bool = true

	for k in range(1, NumRows):
		win1 = (val1 != Value.CLEAR) and win1 and val1 == M[k][k]
		win2 = (val2 != Value.CLEAR) and win2 and val2 == M[k][NumRows - k - 1]

	if win1:
		print("Win in forward diagnal")
	if win2:
		print("Win in backward diagnal")

	final_win = final_win or win1 or win2

	return final_win
