extends Node

const rightOffset = 1
const leftOffset = -1
const upOffset = 1
const downOffset = -1

func queen(cordString:String, chessBoard:Array, colour:int) -> Array:
	var cords: Vector2i
	var move: String
	var psudoLegalMoves: Array = []
	var tempCords:Vector2i
	
	# find piece colour
	# var chessBoardOrigin = Globals.cordToChessBoardCords(cordString)
	# var colour = chessBoard[chessBoardOrigin.x][chessBoardOrigin.y][0]
	
	# all possible offsets if the board in empty
	var offsetArray = [Vector2i(leftOffset,0),Vector2i(rightOffset, 0),Vector2i(0,upOffset),Vector2i(0,downOffset),Vector2i(leftOffset,upOffset),Vector2i(leftOffset, downOffset),Vector2i(rightOffset,upOffset),Vector2i(rightOffset,downOffset)]
	
	# turn cordinate sting into a tuple
	cords = Vector2i((Globals.letter_to_number[cordString.left(1)]) , int(cordString.right(-1)))
	
	# create list of all posible moves if board was empty and infinatly large
	# rook can repeat moves in same turn (ie: move from A1 to B2 to C3 in one turn)
	
	# direction
	for offset in offsetArray:
		# magnitude
		for moveMagnitde in range(1,8):
			# is bishop on the board
			tempCords = Vector2i(cords.x + offset.x*moveMagnitde, cords.y + offset.y*moveMagnitde)
			if 0 <= tempCords.x and tempCords.x <= 7 and 1 <= tempCords.y and tempCords.y <= 8:
				move = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
				# are you moving to a spot not occupied by a piec of your own colour
				if chessBoard[Globals.cordToChessBoardCords(move).x][Globals.cordToChessBoardCords(move).y][0] == colour:
					break

				if chessBoard[Globals.cordToChessBoardCords(move).x][Globals.cordToChessBoardCords(move).y][0] == 0:
					psudoLegalMoves.append(move)
					
				if chessBoard[Globals.cordToChessBoardCords(move).x][Globals.cordToChessBoardCords(move).y][0] == Globals.switch_colour_int[colour]:
					psudoLegalMoves.append(move)
					break
				
	if Globals.debug: print(Globals.int_to_colour[colour], " Queen @", cordString, " " , psudoLegalMoves)
	return psudoLegalMoves

func rook(cordString:String, chessBoard:Array, colour:int) -> Array:
	var cords: Vector2i
	var move: String
	var psudoLegalMoves: Array = []
	var tempCords:Vector2i
	
	# find piece colour
	# var chessBoardOrigin = Globals.cordToChessBoardCords(cordString)
	# var colour = chessBoard[chessBoardOrigin.x][chessBoardOrigin.y][0]
	
	# all possible offsets if the board in empty
	var offsetArray = [Vector2i(leftOffset,0),Vector2i(rightOffset, 0),Vector2i(0,upOffset),Vector2i(0,downOffset)]
	
	# turn cordinate sting into a tuple
	cords = Vector2i((Globals.letter_to_number[cordString.left(1)]) , int(cordString.right(-1)))
	
	# create list of all posible moves if board was empty and infinatly large
	# rook can repeat moves in same turn (ie: move from A1 to B2 to C3 in one turn)
	
	# direction
	for offset in offsetArray:
		# magnitude
		for moveMagnitde in range(1,8):
			# is bishop on the board
			tempCords = Vector2i(cords.x + offset.x*moveMagnitde, cords.y + offset.y*moveMagnitde)
			if 0 <= tempCords.x and tempCords.x <= 7 and 1 <= tempCords.y and tempCords.y <= 8:
				move = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
				# are you moving to a spot not occupied by a piec of your own colour
				if chessBoard[Globals.cordToChessBoardCords(move).x][Globals.cordToChessBoardCords(move).y][0] == colour:
					break

				if chessBoard[Globals.cordToChessBoardCords(move).x][Globals.cordToChessBoardCords(move).y][0] == 0:
					psudoLegalMoves.append(move)
					
				if chessBoard[Globals.cordToChessBoardCords(move).x][Globals.cordToChessBoardCords(move).y][0] == Globals.switch_colour_int[colour]:
					psudoLegalMoves.append(move)
					break
				
	if Globals.debug: print(Globals.int_to_colour[colour], " Rook @", cordString, " " , psudoLegalMoves)
	return psudoLegalMoves

func bishop(cordString:String, chessBoard:Array, colour:int) -> Array:
	var cords: Vector2i
	var move: String
	var psudoLegalMoves: Array = []
	var tempCords:Vector2i
	
	# find piece colour
	# var chessBoardOrigin = Globals.cordToChessBoardCords(cordString)
	# var colour = chessBoard[chessBoardOrigin.x][chessBoardOrigin.y][0]
	
	# all possible offsets if the board in empty
	var offsetArray = [Vector2i(leftOffset,upOffset),Vector2i(leftOffset, downOffset),Vector2i(rightOffset,upOffset),Vector2i(rightOffset,downOffset)]
	
	# turn cordinate sting into a tuple
	cords = Vector2i((Globals.letter_to_number[cordString.left(1)]) , int(cordString.right(-1)))
	
	# create list of all posible moves if board was empty and infinatly large
	# bishop can repeat moves in same turn (ie: move from A1 to B2 to C3 in one turn)
	
	# direction
	for offset in offsetArray:
		# magnitude
		for moveMagnitde in range(1,8):
			# is bishop on the board
			tempCords = Vector2i(cords.x + offset.x*moveMagnitde, cords.y + offset.y*moveMagnitde)
			if 0 <= tempCords.x and tempCords.x <= 7 and 1 <= tempCords.y and tempCords.y <= 8:
				move = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
				# are you moving to a spot not occupied by a piec of your own colour
				if chessBoard[Globals.cordToChessBoardCords(move).x][Globals.cordToChessBoardCords(move).y][0] == colour:
					break

				if chessBoard[Globals.cordToChessBoardCords(move).x][Globals.cordToChessBoardCords(move).y][0] == 0:
					psudoLegalMoves.append(move)
					
				if chessBoard[Globals.cordToChessBoardCords(move).x][Globals.cordToChessBoardCords(move).y][0] == Globals.switch_colour_int[colour]:
					psudoLegalMoves.append(move)
					break

	
	if Globals.debug: print(Globals.int_to_colour[colour], " Bishop @", cordString, " " , psudoLegalMoves)
	return psudoLegalMoves

func king(cordString: String, chessBoard: Array, colour: int, castlingRights) -> Array:
	var cords: Vector2i	
	var move: String
	var psudoLegalMoves: Array = []
	var tempCords:Vector2i
	
	# all possible offsets if the board in empty
	var offsetArray = [Vector2i(0, upOffset),Vector2i(rightOffset, upOffset),Vector2i(rightOffset, 0),Vector2i(rightOffset, downOffset),Vector2i(0, downOffset),Vector2i(leftOffset, downOffset),Vector2i(leftOffset, 0),Vector2i(leftOffset, upOffset)]
	
	# turn cordinate sting into a tuple
	cords = Vector2i((Globals.letter_to_number[cordString.left(1)]) , int(cordString.right(-1)))
	
	# castling
	
	# create list of all posible moves if board was empty and infinatly large
	for offset in offsetArray:
		# is king on the board
		tempCords = Vector2i(cords.x + offset.x, cords.y + offset.y)
		if 0 <= tempCords.x and tempCords.x <= 7 and 1 <= tempCords.y and tempCords.y <= 8:
			move = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
			# are you moving to a spot not occupied by a piece of your own colour
			if not chessBoard[Globals.cordToChessBoardCords(move).x][Globals.cordToChessBoardCords(move).y][0] == colour:
				psudoLegalMoves.append(move)
	
	if Globals.debug: print(Globals.int_to_colour[colour], " King @", cordString, " " , psudoLegalMoves)
	return psudoLegalMoves

func knight(cordString: String, chessBoard: Array, colour: int) -> Array:
	var cords: Vector2i
	var move: String
	var psudoLegalMoves: Array = []
	var tempCords:Vector2i
	
	# find piece colour
	# var chessBoardOrigin = Globals.cordToChessBoardCords(cordString)
	# var colour = chessBoard[chessBoardOrigin.x][chessBoardOrigin.y][0]
	
	# all possible offsets if the board in empty
	var offsetArray = [Vector2i(leftOffset*2,upOffset),Vector2i(leftOffset*2, downOffset),Vector2i(leftOffset,upOffset*2),Vector2i(rightOffset,upOffset*2),Vector2i(rightOffset*2,upOffset),Vector2i(rightOffset*2,downOffset),Vector2i(leftOffset,downOffset*2),Vector2i(rightOffset,downOffset*2)]
	
	# turn cordinate sting into a tuple
	cords = Vector2i((Globals.letter_to_number[cordString.left(1)]) , int(cordString.right(-1)))
	
	# create list of all posible moves if board was empty and infinatly large
	# knight can move over other pieces
	# kight cannot repeat moves in same turn (ie: move from A1 to B3 to C5 in one turn)
	
	for offset in offsetArray:
		# is knight on the board
		tempCords = Vector2i(cords.x + offset.x, cords.y + offset.y)
		if 0 <= tempCords.x and tempCords.x <= 7 and 1 <= tempCords.y and tempCords.y <= 8:
			move = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
			# are you moving to a spot not occupied by a piec of your own colour
			if not chessBoard[Globals.cordToChessBoardCords(move).x][Globals.cordToChessBoardCords(move).y][0] == colour:
				psudoLegalMoves.append(move)
	
	if Globals.debug: print(Globals.int_to_colour[colour], " Knight @", cordString, " " , psudoLegalMoves)
	return psudoLegalMoves

func pawn(cordString: String, chessBoard: Array, colour: int) -> Array:
	var tempCords: Vector2i
	var moveString: String
	var cords: Vector2i
	var psudoLegalMoves: Array = []
	var offsetArray: Array = []
	
	# turn cordinate sting into a tuple
	cords = Vector2i((Globals.letter_to_number[cordString.left(1)]) , int(cordString.right(-1)))
	
	if colour == 1: # white
		tempCords = cords + Vector2i(0, upOffset)
		moveString = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
		if chessBoard[Globals.cordToChessBoardCords(moveString).x][Globals.cordToChessBoardCords(moveString).y][0] == 0:
			offsetArray.append(Vector2i(0, upOffset))

		if cordString.right(-1) == "2": # first row
			tempCords = cords + Vector2i(0, upOffset*2)
			moveString = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
			if chessBoard[Globals.cordToChessBoardCords(moveString).x][Globals.cordToChessBoardCords(moveString).y][0] == 0:
				offsetArray.append(Vector2i(0, upOffset*2))	

		if not cordString.right(-1) == "8": # if on last row (only nesesary until promotion is set up)
			
			if cordString.left(1) == "A":
				# is there a piece to up/right
				tempCords = cords + Vector2i(rightOffset, upOffset)
				moveString = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
				if chessBoard[Globals.cordToChessBoardCords(moveString).x][Globals.cordToChessBoardCords(moveString).y][0] == Globals.switch_colour_int[colour]:
					offsetArray.append(Vector2i(rightOffset, upOffset))
			elif cordString.left(1) == "H":
				# is there a piece to up/left
				tempCords = cords + Vector2i(leftOffset, upOffset)
				moveString = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
				if chessBoard[Globals.cordToChessBoardCords(moveString).x][Globals.cordToChessBoardCords(moveString).y][0] == Globals.switch_colour_int[colour]:
					offsetArray.append(Vector2i(leftOffset, upOffset))
			else:
				# is there a piece to up/right
				tempCords = cords + Vector2i(rightOffset, upOffset)
				moveString = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
				if chessBoard[Globals.cordToChessBoardCords(moveString).x][Globals.cordToChessBoardCords(moveString).y][0] == Globals.switch_colour_int[colour]:
					offsetArray.append(Vector2i(rightOffset, upOffset))
				#  or up/left
				tempCords = cords + Vector2i(leftOffset, upOffset)
				moveString = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
				if chessBoard[Globals.cordToChessBoardCords(moveString).x][Globals.cordToChessBoardCords(moveString).y][0] == Globals.switch_colour_int[colour]:
					offsetArray.append(Vector2i(leftOffset, upOffset))
			

		
	elif colour == 2: # black
		tempCords = cords + Vector2i(0, downOffset)
		moveString = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
		if chessBoard[Globals.cordToChessBoardCords(moveString).x][Globals.cordToChessBoardCords(moveString).y][0] == 0:
			offsetArray.append(Vector2i(0, downOffset))

		if cordString.right(-1) == "7": # first row
			tempCords = cords + Vector2i(0, downOffset*2)
			moveString = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
			if chessBoard[Globals.cordToChessBoardCords(moveString).x][Globals.cordToChessBoardCords(moveString).y][0] == 0:
				offsetArray.append(Vector2i(0, downOffset*2))

		if not cordString.right(-1) == "1": # if on last row (only nesesary until promotion is set up)
			
			if cordString.left(1) == "A":
				# is there a piece to down/right
				tempCords = cords + Vector2i(rightOffset, downOffset)
				moveString = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
				if chessBoard[Globals.cordToChessBoardCords(moveString).x][Globals.cordToChessBoardCords(moveString).y][0] == Globals.switch_colour_int[colour]:
					offsetArray.append(Vector2i(rightOffset, downOffset))
			elif cordString.left(1) == "H":
				# is there a piece to down/left
				tempCords = cords + Vector2i(leftOffset, downOffset)
				moveString = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
				if chessBoard[Globals.cordToChessBoardCords(moveString).x][Globals.cordToChessBoardCords(moveString).y][0] == Globals.switch_colour_int[colour]:
					offsetArray.append(Vector2i(leftOffset, downOffset))
			else:
				# is there a piece to dowm/right
				tempCords = cords + Vector2i(rightOffset, downOffset)
				moveString = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
				if chessBoard[Globals.cordToChessBoardCords(moveString).x][Globals.cordToChessBoardCords(moveString).y][0] == Globals.switch_colour_int[colour]:
					offsetArray.append(Vector2i(rightOffset, downOffset))
				#  or down/left
				tempCords = cords + Vector2i(leftOffset, downOffset)
				moveString = Globals.index_to_letter[tempCords.x] + str(tempCords.y)
				if chessBoard[Globals.cordToChessBoardCords(moveString).x][Globals.cordToChessBoardCords(moveString).y][0] == Globals.switch_colour_int[colour]:
					offsetArray.append(Vector2i(leftOffset, downOffset))
				
	var newPos
	for offset in offsetArray:
		newPos = cords + offset
		psudoLegalMoves.append(Globals.index_to_letter[newPos.x] + str(newPos.y))
					
	if Globals.debug: print(Globals.int_to_colour[colour], " Pawn @", cordString, " " , psudoLegalMoves)
	return psudoLegalMoves

func _ready():
	# break if debug is set to false
	if not Globals.debug: return
	
	var WKingH1 = king("H1", Globals.starting_chess_board, 1, Globals.castlingRights)
	assert(WKingH1 == [], "TEST FAILED: White King @ H1 - Starting Chess Board")
	
	var WKingH4 = king("H4", Globals.starting_chess_board, 1, Globals.castlingRights)
	assert(WKingH4 == ["H5", "H3", "G3", "G4", "G5"], "TEST FAILED: White King @ H4 - Starting Chess Board")
	
	var WKingH8 = king("H8", Globals.starting_chess_board, 1, Globals.castlingRights)
	assert(WKingH8 == ["H7", "G7", "G8"], "TEST FAILED: White King @ H8 - Starting Chess Board")
	
	var BKingH1 = king("H1", Globals.starting_chess_board, 2, Globals.castlingRights)
	assert(BKingH1 == ["H2", "G1", "G2"], "TEST FAILED: Black King @ H1 - Starting Chess Board")
	
	var BKingH4 = king("H4", Globals.starting_chess_board, 2, Globals.castlingRights)
	assert(BKingH4 == ["H5", "H3", "G3", "G4", "G5"], "TEST FAILED: Black King @ H4 - Starting Chess Board")
	
	var BKingH8 = king("H8", Globals.starting_chess_board, 2, Globals.castlingRights)
	assert(BKingH8 == [], "TEST FAILED: Black King @ H8 - Starting Chess Board")
	
	var WKnightB6 = knight("B6", Globals.starting_chess_board, 1)
	assert(WKnightB6 == ["A8", "C8", "D7", "D5", "A4", "C4"], "TEST FAILED: White Knight @ B6 - Starting Chess Board")
	
	var BKnightB6 = knight("B6", Globals.starting_chess_board, 2)
	assert(BKnightB6 == ["D5", "A4", "C4"], "TEST FAILED: Black Knight @ B6 - Starting Chess Board")
	
	var WKnightB1 = knight("B1", Globals.starting_chess_board, 1)
	assert(WKnightB1 == ["A3", "C3"], "TEST FAILED: White Knight @ B1 - Starting Chess Board")
	
	var WPawnB2 = pawn("B2", Globals.starting_chess_board, 1)
	assert(WPawnB2 == ["B3", "B4"], "TEST FAILED: White Pawn @ B2 - Starting Chess Board")
	
	var BPawnB2 = pawn("B2", Globals.starting_chess_board, 2)
	assert(BPawnB2 == ["C1", "A1"], "TEST FAILED: Black Pawn @ B2 - Starting Chess Board")
	
	var WPawnA5 = pawn("A5", Globals.starting_chess_board, 1)
	assert(WPawnA5 == ["A6"], "TEST FAILED: White Pawn @ A5 - Starting Chess Board")
	
	var WPawnA6 = pawn("A6", Globals.starting_chess_board, 1)
	assert(WPawnA6 == ["B7"], "TEST FAILED: White Pawn @ A6 - Starting Chess Board")
	
	var BPawnH3 = pawn("H3", Globals.starting_chess_board, 2)
	assert(BPawnH3 == ["G2"], "TEST FAILED: Black Pawn @ H3 - Starting Chess Board")
	
	var WBishopA5 = bishop("A5", Globals.starting_chess_board, 1)
	assert(WBishopA5 == ["B6", "C7", "B4", "C3"], "TEST FAILED: White Bishop @ A5 - Starting Chess Board")
	
	var BBishopA6 = bishop("A6", Globals.starting_chess_board, 2)
	assert(BBishopA6 == ["B5", "C4", "D3", "E2"], "TEST FAILED: Black Bishop @ A6 - Starting Chess Board")
	
	var WBishopH8 = bishop("H8", Globals.starting_chess_board, 1)
	assert(WBishopH8 == ["G7"], "TEST FAILED: White Bishop @ H8 - Starting Chess Board")
	
	var WRookA5 = rook("A5", Globals.starting_chess_board, 1)
	assert(WRookA5 == ["B5", "C5", "D5", "E5", "F5", "G5", "H5", "A6", "A7", "A4", "A3"], "TEST FAILED: White Rook @ A5 - Starting Chess Board")
	
	var BRookH6 = rook("H6", Globals.starting_chess_board, 2)
	assert(BRookH6 == ["G6", "F6", "E6", "D6", "C6", "B6", "A6", "H5", "H4", "H3", "H2"], "TEST FAILED: Black Rook @ H6 - Starting Chess Board")
	
	var WRookH1 = rook("H1", Globals.starting_chess_board, 1)
	assert(WRookH1 == [], "TEST FAILED: White Rook @ H1 - Starting Chess Board")
	
	var WQueenA5 = queen("A5", Globals.starting_chess_board, 1)
	assert(WQueenA5 == ["B5", "C5", "D5", "E5", "F5", "G5", "H5", "A6", "A7", "A4", "A3", "B6", "C7", "B4", "C3"], "TEST FAILED: White Queen @ A5 - Starting Chess Board")
	
	var BQueenH6 = queen("H6", Globals.starting_chess_board, 2)
	assert(BQueenH6 == ["G6", "F6", "E6", "D6", "C6", "B6", "A6", "H5", "H4", "H3", "H2", "G5", "F4", "E3", "D2"], "TEST FAILED: Black Queen @ H6 - Starting Chess Board")
	
	var WQueenH1 = queen("H1", Globals.starting_chess_board, 1)
	assert(WQueenH1 == [], "TEST FAILED: White Queen @ H1 - Starting Chess Board")
