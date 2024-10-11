extends Node
class_name Game

signal MOVE_UPDATE(x, y)

func _ready():
	pass
	
func test(x: int, y: int):
	print(x, y)
	MOVE_UPDATE.emit(x, y)
	