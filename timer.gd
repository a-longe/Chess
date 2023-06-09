extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	if "White" in name:
		text = str(Globals._white_start_time)
	if "Black" in name:
		text = str(Globals._black_start_time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# count down timer every frame, subtracting the time between frames to keep and accurate time even with different fps
	if Globals.turn == "White" and "White" in name:
		Globals.white_time_current -= delta
		text = str("%.1f" % Globals.white_time_current)
		
	elif Globals.turn == "Black" and "Black" in name:
		Globals.black_time_current -= delta
		text = str("%.1f" % Globals.black_time_current)
	
	# if a timer is <= 0 or if Global.gameOver == true
	if Globals.black_time_current <= 0:
		# game over for black
		Globals.gameOver = true
		Globals.winningColour = "White"
		
	if Globals.white_time_current <= 0:
		# game over for white
		Globals.gameOver = true
		Globals.winningColour = "Black"
