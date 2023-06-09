extends Node

var nodeBeingPromoted
var piecePromotedTo

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Globals.whiteToPromote:
		$WhitePromotionGUI.visible = true
		
	if Globals.blackToPromote:
		$BlackPromotionGUI.visible = true


func _on_white_promotion_gui_id_pressed(id):
	var pieceTypeToPromoteTo:String
	match id:
		1:pieceTypeToPromoteTo = "Queen"
		2:pieceTypeToPromoteTo = "Rook"
		3:pieceTypeToPromoteTo = "Bishop"
		4:pieceTypeToPromoteTo = "Knight"

	$"WhitePromotionGUI".visible = false
	piecePromotedTo = Globals.pieceToPromote.replace("Pawn", pieceTypeToPromoteTo)

	# set piece name and icon to queen
	nodeBeingPromoted = get_node("../Pieces/"+Globals.pieceToPromote)
	nodeBeingPromoted.icon = load("res://Chess Pieces Images/White"+ pieceTypeToPromoteTo +".png")
	nodeBeingPromoted.name = piecePromotedTo
	Globals.whiteToPromote = false


func _on_black_promotion_gui_id_pressed(id):
	var pieceTypeToPromoteTo:String
	match id:
		1:pieceTypeToPromoteTo = "Queen"
		2:pieceTypeToPromoteTo = "Rook"
		3:pieceTypeToPromoteTo = "Bishop"
		4:pieceTypeToPromoteTo = "Knight"

	$"BlackPromotionGUI".visible = false
	piecePromotedTo = Globals.pieceToPromote.replace("Pawn", pieceTypeToPromoteTo)
			
	# set piece name and icon to queen
	nodeBeingPromoted = get_node("../Pieces/"+Globals.pieceToPromote)
	nodeBeingPromoted.icon = load("res://Chess Pieces Images/Black"+ pieceTypeToPromoteTo +".png")
	nodeBeingPromoted.name = piecePromotedTo
	Globals.blackToPromote = false

