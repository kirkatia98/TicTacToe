extends Node


#import shortcuts
var Player: Dictionary = GameState.Player
var PlayerText: Dictionary = GameState.PlayerText

var Value: Dictionary = GameState.Value
var ValueText: Dictionary = GameState.Value


func _ready():
	# Unit Tests
	test_HUD()


func test_HUD():
	test_HUD_board()
	test_HUD_players()


func test_HUD_board():

	%HUD.set_value(1, 1, Value.O)
	%HUD.set_value(0, 2, Value.X)

	%HUD.set_value(2, 2, Value.O)
	%HUD.set_value(2, 2, Value.X)

	%HUD.set_value(1, 2, Value.O)
	%HUD.clear_value(1, 2)

	#Basic sets work
	assert(%HUD.get_value(1, 1) == Value.O)
	assert(%HUD.get_value(0, 2) == Value.X)

	#Unset tiles are still clear
	assert(%HUD.get_value(1, 2) == Value.CLEAR)

	#Overwrites work
	assert(%HUD.get_value(2, 2) == Value.X)

	#Clearing a value works
	assert(%HUD.get_value(1,2) == Value.CLEAR)

	#reset
	%HUD.clear_board()


func test_HUD_players():
	# Basic sets work
	%HUD.set_player(1)
	assert(%HUD.get_player() == 1)
	%HUD.set_player(2)
	assert(%HUD.get_player() == 2)

	# Double setting works
	%HUD.set_player(1)
	%HUD.set_player(1)
	assert(%HUD.get_player() == 1)

	# Clearing player works
	%HUD.set_player()
	assert(%HUD.get_player() == 0)

	#reset
	%HUD.set_player(1)
