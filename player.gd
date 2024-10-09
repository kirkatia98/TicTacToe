extends MarginContainer

@onready var label = $Label
var is_my_turn = false

# enable code if it's my turn
func set_turn(my_turn : bool):
	is_my_turn = my_turn
	if(my_turn):
		label.label_settings.outline_color = Color.DARK_BLUE
		label.label_settings.outline_size = 10
	else:
		label.label_settings.outline_color = Color.WHITE
		label.label_settings.outline_size = 0


func get_turn() -> bool:
	return is_my_turn
