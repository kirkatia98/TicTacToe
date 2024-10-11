extends Node
class_name Game


func _ready():
	%HUD.grid.connect_callbacks(test)
	pass
	
func test(x: int, y: int):
	print(x, y)