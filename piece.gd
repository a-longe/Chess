extends Button

signal stoppedDragging
signal starttedDragging
var canDrag
var chessBoardCords = Vector2i()
var startingChessBoardCords = Vector2i()
var startOfDragCords = Vector2()
var pieceType: String
var colourString: String

func _ready():
	pieceType = name.left(-2).trim_prefix("White").trim_prefix("Black")
	colourString = name.left(5)

# Called when the node enters the scene tree for the first time.
func on_piece_move():
	pass

func _process(_delta):
	if canDrag:
		$".".global_position = get_global_mouse_position() - Vector2(size.x/2, size.y/2)
	
func piece_to_be_destoyed_name():
	return (Globals.int_to_colour[Globals.current_chess_board[chessBoardCords.y][chessBoardCords.x][0]]+Globals.int_to_piece[Globals.current_chess_board[chessBoardCords.y][chessBoardCords.x][1]]+Globals.cordsToSnapTo)
	
func _on_button_up():
	# await _input for snapping before we "drop" the piece
	await("SnapComplete")
	canDrag = false
	Globals.isDragging = false
	
	# if is your turn
	if (Globals.turn == "White" and "White" == name.left(5)) or (Globals.turn == "Black" and "Black" == name.left(5)):
						
		if not Globals.cordsToSnapTo == "":
			# convert snapping cords to chess board array indecies
			chessBoardCords = Vector2i((Globals.letter_to_number[Globals.cordsToSnapTo.left(1)]), (8-int(Globals.cordsToSnapTo.right(-1))))
			startingChessBoardCords = Vector2i((Globals.letter_to_number[(get_meta("cords").left(1))]), (8-int(get_meta("cords").right(-1))))			
			
			var possibleMovesArray: Array
			
			# is move in list of possible moves
			match pieceType:
				"Pawn":
					possibleMovesArray = PossibleMoves.pawn(get_meta("cords"), Globals.current_chess_board, Globals.colour_to_int[name.left(5)])
				"Knight":
					possibleMovesArray = PossibleMoves.knight(get_meta("cords"), Globals.current_chess_board, Globals.colour_to_int[name.left(5)])
				"King":
					possibleMovesArray = PossibleMoves.king(get_meta("cords"), Globals.current_chess_board, Globals.colour_to_int[name.left(5)], Globals.castlingRights)
				"Rook":
					possibleMovesArray = PossibleMoves.rook(get_meta("cords"), Globals.current_chess_board, Globals.colour_to_int[name.left(5)])
				"Bishop":
					possibleMovesArray = PossibleMoves.bishop(get_meta("cords"), Globals.current_chess_board, Globals.colour_to_int[name.left(5)])
				"Queen":
					possibleMovesArray = PossibleMoves.queen(get_meta("cords"), Globals.current_chess_board, Globals.colour_to_int[name.left(5)])
					
			if not Globals.cordsToSnapTo in possibleMovesArray:
				if Globals.cordsToSnapTo == get_meta("cords"): #if trying to move to same position as where you started
					print("Cant move there, you can only move to", possibleMovesArray)
					# TODO add in some visual way of seeing where you can move 
				else:
					print("Cant Move There")
				position = get_node(str("/root/Node2D/boardSquares/Square - " + get_meta("cords"))).position - Vector2($"/root/Node2D/boardSquares/Square - A1".get_scale() / 2)
				return
				
			# destroy piece we are taking
			if Globals.current_chess_board[chessBoardCords.y][chessBoardCords.x][0] == 0:
				print("No piece to where we're moving")
			elif Globals.current_chess_board[chessBoardCords.y][chessBoardCords.x][0] == Globals.colour_to_int[name.left(5)]:
				print("Trying to move to space occupied with your own piece")
				position = get_node(str("/root/Node2D/boardSquares/Square - " + get_meta("cords"))).position - Vector2($"/root/Node2D/boardSquares/Square - A1".get_scale() / 2)
				return
			else:
				print("moving to square with enemy piece, destoying ", piece_to_be_destoyed_name())
				get_node(("/root/Node2D/Pieces/" + piece_to_be_destoyed_name())).queue_free()
			
			# change array repersentation
			# set new location to old location
			Globals.current_chess_board[chessBoardCords.y][chessBoardCords.x] = Globals.current_chess_board[startingChessBoardCords.y][startingChessBoardCords.x]
			
			# set old location to an empty
			Globals.current_chess_board[startingChessBoardCords.y][startingChessBoardCords.x] = Vector2i(0,0)
			
			# change piece position
			position = get_node(str("/root/Node2D/boardSquares/Square - " + Globals.cordsToSnapTo)).position - Vector2($"/root/Node2D/boardSquares/Square - A1".get_scale() / 2)
			set_name(name.left(-2) + Globals.cordsToSnapTo)
			set_meta("cords", Globals.cordsToSnapTo)
			
			# check if pawn is on last row and if so display promotion GUI
			if pieceType == "Pawn":
				if colourString == "White":
					if "8" in get_meta("cords"):
						Globals.whiteToPromote = true
						Globals.pieceToPromote = name
						await $".".renamed # wait for promotion script to complete
						print("White Pawn @ " + get_meta("cords"), " has promoted to a " + pieceType)
						pieceType = name.left(-2).trim_prefix("White").trim_prefix("Black")
						
				else:
					# colour is black
					if "1" in get_meta("cords"):
						Globals.blackToPromote = true
						Globals.pieceToPromote = name
						await $".".renamed # wait for promotion script to complete
						pieceType = name.left(-2).trim_prefix("White").trim_prefix("Black")
						print("Black Pawn @ " + get_meta("cords"), " has promoted to a " + pieceType)

			# swap turns
			if Globals.turn == "White":
				print("Black's turn - ", str(snapped(Globals.black_time_current, 0.01)), " seconds left")
				Globals.turn = "Black"
			elif Globals.turn == "Black":
				print("White's turn - ", str(snapped(Globals.white_time_current, 0.01)), " seconds left")
				Globals.turn = "White"
					
			# print debug info
			if Globals.debug:
				print("chess board cords  -  from ", startingChessBoardCords, " to ", chessBoardCords)
				for row in Globals.current_chess_board:
					print(row)

func _on_button_down():
	Globals.cordsToSnapTo = ""
	startOfDragCords = get_global_mouse_position()
	if (Globals.turn == "White" and "White" in str(name)) or (Globals.turn == "Black" and "Black" in str(name)):
		canDrag = true
		Globals.isDragging = true
