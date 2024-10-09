extends Node



func _ready():
	# Unit Tests
	test_HUD()



func test_HUD():
	test_HUD_board()
	test_HUD_players()


func test_HUD_board():

	%HUD.set_value(1, 1, Board.Value.O)
	%HUD.set_value(0, 2, Board.Value.X)
	%HUD.set_value(2, 2, Board.Value.O)
	%HUD.set_value(0, 1, Board.Value.X)

	assert(%HUD.get_value(1, 1) == Board.Value.O)
	assert(%HUD.get_value(0, 2) == Board.Value.X)

	assert(%HUD.get_value(1, 2) == Board.Value.CLEAR)

	%HUD.clear_board()


func test_HUD_players():
	%HUD.set_player(1)
	assert(%HUD.get_player() == 1)

	%HUD.set_player(2)
	assert(%HUD.get_player() == 2)

	%HUD.set_player(1)
	%HUD.set_player(1)
	assert(%HUD.get_player() == 1)

	%HUD.set_player()
	assert(%HUD.get_player() == 0)
