extends Button
class_name Box

var value: GameState.Value = GameState.Value.CLEAR

func get_value() -> GameState.Value:
	return value


func set_value(v : GameState.Value):
	value = v
	text = GameState.ValueText[v]

	#Turn button on/off if it's writen as having a value
	disabled = (v != GameState.Value.CLEAR)
