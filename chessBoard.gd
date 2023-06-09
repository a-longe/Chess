extends Node2D

# format will be Vector2i(Piece: 1 for pawn, Colour: 0 for white, 1 for black)
var BoardArray = []

# Called when the node enters the scene tree for the first time.
func _ready():
		
	BoardArray = Globals.starting_chess_board
