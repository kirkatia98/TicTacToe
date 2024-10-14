extends Node

#import shortcut
var Player: Dictionary = GameState.Player
var PlayerName: Dictionary = GameState.PlayerName
var PlayerToken: Dictionary = GameState.PlayerToken

@onready var player : GameState.Player
@onready var token : GameState.Value

@onready var game : Game = Game.new()
@onready var hud : HUD = %HUD

func _ready():
	hud.clear_board()
	set_player(Player.ONE)

	SM.MOVE_UPDATE.connect(process_move)

func process_move(x, y):
	# set UI board
	hud.update_board(x, y, token)

	# set an internal grid
	game.update_game(x, y, token)

	# check for a win state
	if(game.check_win()):
		set_player(Player.NONE)
	else:
		pass_turn()


func set_player(p = Player.NONE):
	player = p
	token = PlayerToken[p]

	hud.set_player(p)


func pass_turn():
	match player:
		GameState.Player.ONE:
			set_player(Player.TWO)
		GameState.Player.TWO:
			set_player(Player.ONE)
		GameState.Player.NONE:
			assert(false, "No player selected")
