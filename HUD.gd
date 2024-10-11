extends Control
class_name HUD

#import shortcuts
var Player: Dictionary = GameState.Player
var PlayerName: Dictionary = GameState.PlayerName

var PlayerToken: Dictionary = GameState.PlayerToken

@onready var grid : Grid = $GamePanel/Grid
@onready var p1 : ScoreManager = $GamePanel/Player1
@onready var p2 : ScoreManager = $GamePanel/Player2

@onready var player : GameState.Player
@onready var token : GameState.Value


func _ready():
	p2.set_player_name(PlayerName[Player.TWO])
	p1.set_player_name(PlayerName[Player.ONE])
	
	grid.clear_board()
	set_player(Player.ONE)


func set_player(p = Player.NONE):
	player = p

	p1.set_turn(p == Player.ONE)
	p2.set_turn(p == Player.TWO)


func get_player() -> GameState.Player:
	return player


func pass_turn():
	match player:
		GameState.Player.ONE:
			set_player(Player.TWO)
		GameState.Player.TWO:
			set_player(Player.ONE)
		GameState.Player.NONE:
			assert(false, "No player selected")


func unit_test():
	# Basic sets work
	set_player(Player.ONE)
	assert(get_player() == Player.ONE)
	set_player(Player.TWO)
	assert(get_player() == Player.TWO)

	# Double setting works
	set_player(Player.ONE)
	set_player(Player.ONE)
	assert(get_player() == Player.ONE)

	# set none player
	set_player()
	assert(get_player() == Player.NONE)

	#reset
	set_player(Player.ONE)