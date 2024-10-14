extends Control
class_name HUD

var Player: Dictionary = GameState.Player
var PlayerName: Dictionary = GameState.PlayerName

@onready var board : Board = $GamePanel/Board
@onready var p1 : Score = $GamePanel/Player1
@onready var p2 : Score = $GamePanel/Player2


func _ready():
	p2.set_player_name(PlayerName[Player.TWO])
	p1.set_player_name(PlayerName[Player.ONE])


func set_player( p : GameState.Player ):
	p1.set_turn(p == Player.ONE)
	p2.set_turn(p == Player.TWO)


func update_board(x : int, y : int, token : GameState.Value):
	board.update_cell(x, y, token)


func clear_board():
	board.clear_grid()
