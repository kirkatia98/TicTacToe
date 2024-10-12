extends Node

var Player: Dictionary = GameState.Player
var PlayerName: Dictionary = GameState.PlayerName

var PlayerToken: Dictionary = GameState.PlayerToken

@onready var player : GameState.Player
@onready var token : GameState.Value


func _ready():
	clear_board()
	set_player(Player.ONE)

	SM.MOVE_UPDATE.connect(process_move)

func process_move(x, y):
	%HUD.grid().set_cell(x, y, token)
	# TODO: set an internal grid, and check for a win state here
	pass_turn()


func clear_board():
	%HUD.grid().clear_grid()


func set_player(p = Player.NONE):
	player = p
	token = PlayerToken[p]

	%HUD.p1().set_turn(p == Player.ONE)
	%HUD.p2().set_turn(p == Player.TWO)


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
