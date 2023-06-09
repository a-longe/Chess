extends Node2D

var relative_pos
var snapping_cords = Vector2()

signal SnapCompete

func _ready():
	Globals._chess_board_top_left = $"Square - A8".get_position() - ($"Square - A8".get_scale() / 2)
	Globals._chess_board_bottom_right = $"Square - H1".get_position() + ($"Square - H1".get_scale() / 2)
	if Globals.debug:
		print("top left orgin: ",$"Square - A8".get_position()," scale: ",$"Square - A8".get_scale()," global top left: ",Globals._chess_board_top_left)
		print("bottom right origin: ",$"Square - H1".get_position()," scale: ",$"Square - H1".get_scale()," global bottom right: ",Globals._chess_board_bottom_right)
		

func snapToSquare():
	relative_pos = get_global_mouse_position() - Globals._chess_board_top_left
	snapping_cords = Vector2(floor(relative_pos.x / 64), floor(relative_pos.y / 64))
	print("")
	# print("event @ ", get_global_mouse_position())
	# print("event in relation to board space ", get_global_mouse_position() - Globals._chess_board_top_left)
	# print("dropping piece, board pos is ", snapping_cords , " - " , Globals.index_to_letter[snapping_cords.x], 8 - snapping_cords.y)
	Globals.cordsToSnapTo = Globals.index_to_letter[snapping_cords.x] + str(8 - snapping_cords.y)
	
func _input(event):
	if event is InputEventMouseButton and not event.is_pressed():
		# On mouse unclick (mouse up)
		# is mouse on chess board?
		if get_global_mouse_position().x >= Globals._chess_board_top_left.x and get_global_mouse_position().y >= Globals._chess_board_top_left.y and get_global_mouse_position().x <= Globals._chess_board_bottom_right.x and get_global_mouse_position().y <= Globals._chess_board_bottom_right.y:
			relative_pos = get_global_mouse_position() - Globals._chess_board_top_left
			snapping_cords = Vector2(floor(relative_pos.x / 64), floor(relative_pos.y / 64))
			# is dropping piece?
			if Globals.isDragging:
				emit_signal("SnapCompete")
				snapToSquare()
		else:
			print("Out of board")
