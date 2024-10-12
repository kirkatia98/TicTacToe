extends Control
class_name HUD

var Player: Dictionary = GameState.Player
var PlayerName: Dictionary = GameState.PlayerName

@onready var _grid : Grid = $GamePanel/Grid
@onready var _p1 : Score = $GamePanel/Player1
@onready var _p2 : Score = $GamePanel/Player2


func _ready():
	_p2.set_player_name(PlayerName[Player.TWO])
	_p1.set_player_name(PlayerName[Player.ONE])


func grid():
	return _grid

func p1():
	return _p1

func p2():
	return _p2
