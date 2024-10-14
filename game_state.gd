extends Resource
class_name GameState

enum Player {
	NONE = 0,
	ONE = 1,
	TWO = 2,
}

static var PlayerName: Dictionary = {
	Player.NONE: "_",
	Player.ONE: "player 1",
	Player.TWO: "player 2"
}

enum Value {
	O = -1,
	CLEAR = 0,
	X = 1,
}

static var ValueText: Dictionary = {
	Value.CLEAR: "_",
	Value.O: "O",
	Value.X: "X"
}


static var PlayerToken : Dictionary = {
	Player.NONE: Value.CLEAR,
	Player.ONE: Value.O,
	Player.TWO: Value.X
}


static var NumRows: int = 3
static var NumCols: int = 3
static var WinLength: int = 3
