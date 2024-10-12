extends Node
class_name SignalManager

signal MOVE_UPDATE(x, y)
	
func move_update(x, y):
	print_debug("%d %d" % [x, y])
	MOVE_UPDATE.emit(x, y)


