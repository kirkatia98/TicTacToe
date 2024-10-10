extends Resource
class_name GameState

enum Player {
	NONE = 0,
	ONE = 1,
	TWO = 2,
}

static var PlayerText: Dictionary = {
	Player.NONE: "_",
	Player.ONE: "player 1",
	Player.TWO: "player 2"
}

enum Value {
	CLEAR = -1,
	O = 0,
	X = 1,
}

static var ValueText: Dictionary = {
	Value.CLEAR: "_",
	Value.O: "O",
	Value.X: "X"
}
