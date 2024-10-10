extends Control
class_name HUD

#import shortcuts
var Player: Dictionary = GameState.Player
var PlayerText: Dictionary = GameState.PlayerText

var Value: Dictionary = GameState.Value
var ValueText: Dictionary = GameState.Value

@onready var grid = $GamePanel/Grid
@onready var p1 = $Player1
@onready var p2 = $Player2

# set player turn, and use it to flip the button values on signal
@onready var player : GameState.Player


func _ready():
	p2.set_player_name(PlayerText[Player.TWO])
	p1.set_player_name(PlayerText[Player.ONE])

	set_player(Player.ONE)



func set_player(p = Player.NONE):
	player = p
	p1.set_turn(p == Player.ONE)
	p2.set_turn(p == Player.TWO)


func get_player() -> GameState.Player:
	return player

func clear_board():
	print("CLEAR BOARD")
	for box in grid.get_children():
		box.set_value(Value.CLEAR)


func clear_value(x, y):
	print("CLEAR < %d, %d >" % [x, y])

	var box = grid.get_child(x + 3*y)
	box.set_value(Value.CLEAR)


func set_value(x, y, value: GameState.Value):
	print("SET < %d, %d >: %s" % [x, y, Value.find_key(value)])

	var box = grid.get_child(x + 3*y)
	box.set_value(value)


func get_value(x, y) -> GameState.Value:
	var box = grid.get_child(x + 3*y)
	var value = box.get_value()

	print("GET < %d, %d >: %s" % [x, y, Value.find_key(value)])
	return value
