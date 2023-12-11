extends ColorRect

@export var Tiletype = 0 
var options = [1,2,3,4,5,6,7,8,9,10,11,12]

var up = []
var down =[]
var left = []
var right = []

var rnd = RandomNumberGenerator.new()
var pos = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	setTile()
	

func setTile():
	var upLine = [1,3,5,8,9,10,11]
	var downLine = [1,4,5,6,7,8,11]
	var leftLine = [1,2,3,6,7,8,10]
	var rightLine = [2,3,4,7,8,9,11]
	
	var upEmpty = [2,4,6,7,12]
	var downEmpty = [2,3,9,10,12]
	var leftEmpty = [4,5,9,11,12]
	var rightEmpty = [1,5,6,10,12]
	
	match Tiletype:
		0:
			color = Color("#9b9b9b")
		1:
			$Sprite2D.texture =  load("res://tiles/01.png")
			up = upLine
			down = downLine
			left = leftEmpty
			right = rightLine
		2:
			$Sprite2D.texture =  load("res://tiles/02.png")
			up = upEmpty
			down = downEmpty
			left = leftLine
			right = rightLine
		3:
			$Sprite2D.texture =  load("res://tiles/03.png")
			up = upEmpty
			down = downLine
			left = leftLine
			right = rightLine
		4:
			$Sprite2D.texture =  load("res://tiles/04.png")
			up = upLine
			down = downEmpty
			left = leftLine
			right = rightEmpty
		5:
			$Sprite2D.texture =  load("res://tiles/05.png")
			up = upLine
			down = downLine
			left = leftEmpty
			right = rightEmpty
		6:
			$Sprite2D.texture =  load("res://tiles/06.png")
			up = upLine
			down = downEmpty
			left = leftEmpty
			right = rightLine
		7:
			$Sprite2D.texture =  load("res://tiles/07.png")
			up = upLine
			down = downEmpty
			left = leftLine
			right = rightLine
		8:
			$Sprite2D.texture =  load("res://tiles/08.png")
			up = upLine
			down = downLine
			left = leftLine
			right = rightLine
		9:
			$Sprite2D.texture =  load("res://tiles/09.png")
			up = upEmpty
			down = downLine
			left = leftLine
			right = rightEmpty
		10:
			$Sprite2D.texture =  load("res://tiles/10.png")
			up = upEmpty
			down = downLine
			left = leftEmpty
			right = rightLine
		11:
			$Sprite2D.texture =  load("res://tiles/11.png")
			up = upLine
			down = downLine
			left = leftLine
			right = rightEmpty
		12:
			$Sprite2D.texture =  load("res://tiles/12.png")
			up = upEmpty
			down = downEmpty
			left = leftEmpty
			right = rightEmpty
		

func getEntrophy():
	if options.size() == 0:
		return 13
	return options.size()

func collapse():
	if options.size() == 0:
		return 
	var c = options[rnd.randf_range(0, options.size())]
	Tiletype = c
	options.clear()
	setTile()
