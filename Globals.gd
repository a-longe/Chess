extends Node

const debug:bool = false

var gameOver: bool = false
var winningColour: String

var castlingRights = "lsLS" # long and short for white and LONG and SHORT for black

var blackToPromote:bool = false
var whiteToPromote:bool = false
var pieceToPromote:String


var index_to_letter = ["A","B","C","D","E","F","G","H"]
var letter_to_number = {
	"A": 0,
	"B": 1,
	"C": 2,
	"D": 3,
	"E": 4,
	"F": 5,
	"G": 6,
	"H": 7
}

var switch_colour_int = {
	1: 2,
	2: 1
	
}

var switch_colours = {
	"Black": "White",
	"White": "Black"
}

var colour_to_int = {
	"White": 1,
	"Black": 2
}
var int_to_colour = {
	1: "White",
	2: "Black"
}

var int_to_piece = {
	1: "Pawn",
	2: "Knight",
	3: "Bishop",
	4: "Rook",
	5: "Queen",
	6: "King"
}

# isDragging is used for snapping function and not for individule pieces
var isDragging = false

var cordsToSnapTo : String = ""

var turn = "White"
const _white_start_time = 600.0
const _black_start_time = 600.0

var white_time_current = _white_start_time
var black_time_current = _black_start_time

var _chess_board_top_left = Vector2()
var _chess_board_bottom_right = Vector2()

# first index is which columb 
# second is where in the row
# third index is choosing between colour [0] and piece [1]:
	# colour - none: 0, white: 1, black: 2
	# piece - none: 0, pawn: 1, knight: 2, bishop: 3, rook: 4, queen: 5, king: 6
var starting_chess_board = [
	[Vector2i(2,4), Vector2i(2,2), Vector2i(2,3), Vector2i(2,5), Vector2i(2,6), Vector2i(2,3), Vector2i(2,2), Vector2i(2,4)],
	[Vector2i(2,1), Vector2i(2,1), Vector2i(2,1), Vector2i(2,1), Vector2i(2,1), Vector2i(2,1), Vector2i(2,1), Vector2i(2,1)],
	[Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0)],
	[Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0)],
	[Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0)],
	[Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0), Vector2i(0,0)],
	[Vector2i(1,1), Vector2i(1,1), Vector2i(1,1), Vector2i(1,1), Vector2i(1,1), Vector2i(1,1), Vector2i(1,1), Vector2i(1,1)],
	[Vector2i(1,4), Vector2i(1,2), Vector2i(1,3), Vector2i(1,5), Vector2i(1,6), Vector2i(1,3), Vector2i(1,2), Vector2i(1,4)]
]

var current_chess_board = starting_chess_board

func cordToChessBoardCords(string: String):
	var cordX = string.left(1) # A
	var cordY = string.right(-1) # 1
	return Vector2i(8 - int(cordY), int(Globals.letter_to_number[cordX]))
	

