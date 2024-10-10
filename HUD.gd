extends Control
class_name HUD

#import shortcuts
var Player: Dictionary     = GameState.Player
var PlayerName: Dictionary = GameState.PlayerName

var Value: Dictionary = GameState.Value
var ValueText: Dictionary = GameState.Value

var PlayerToken: Dictionary = GameState.PlayerToken

@onready var grid = $GamePanel/Grid
@onready var p1 = $GamePanel/Player1
@onready var p2 = $GamePanel/Player2

@onready var player : GameState.Player
@onready var token : GameState.Value

static var num_rows: int = 3
static var num_cols: int = 3


func _ready():
	p2.set_player_name(PlayerName[Player.TWO])
	p1.set_player_name(PlayerName[Player.ONE])

	# connect each button to a lambda function to set itself
	
	for y in range(0, num_rows):
		for x in range(0, num_cols):
		
			var box : Box = grid.get_child(x + y * num_rows)
	
			var press_callback = func ():
				set_cell(x, y, token)
				pass_turn()
	
				box.disabled = true
	
			box.connect("pressed", press_callback)
		
	clear_board()
	set_player(Player.ONE)


func set_player(p = Player.NONE):
	player = p
	token = PlayerToken[p]

	p1.set_turn(p == Player.ONE)
	p2.set_turn(p == Player.TWO)

func get_player() -> GameState.Player:
	return player

func pass_turn():
	match player:
		Player.ONE:
			set_player(Player.TWO)
		Player.TWO:
			set_player(Player.ONE)
		Player.NONE:
			assert("No player selected")

func clear_board():
	print("CLEAR BOARD")
	for box in grid.get_children():
		box.set_value(Value.CLEAR)

func clear_cell(x, y):
	print("CLEAR < %d, %d >" % [x, y])

	var box = grid.get_child(x + num_rows * y)
	box.set_value(Value.CLEAR)


func set_cell(x, y, val: GameState.Value):
	print("SET < %d, %d >: %s" % [x, y, Value.find_key(val)])

	var box = grid.get_child(x + num_rows*y)
	box.set_value(val)


func get_cell(x, y) -> GameState.Value:
	var box = grid.get_child(x + num_rows * y)
	var val = box.get_value()

	print("GET < %d, %d >: %s" % [x, y, Value.find_key(val)])
	return val
	