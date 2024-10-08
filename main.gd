extends Node



func _ready():

	%HUD.set_value(1, 1, Board.Value.O)
	%HUD.set_value(0, 2, Board.Value.X)
	%HUD.set_value(2, 2, Board.Value.O)
	%HUD.set_value(0, 1, Board.Value.X)

	assert(%HUD.get_value(1, 1) == Board.Value.O)
	assert(%HUD.get_value(0, 2) == Board.Value.X)

	assert(%HUD.get_value(1, 2) == Board.Value.CLEAR)

	%HUD.clear_board()
