extends ColorRect
enum  type{EMPTY, SEA, COAST, LAND}
@export var Tiletype = type.EMPTY 
var options = [type.SEA, type.COAST, type.LAND]

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
	match Tiletype:
		type.EMPTY:
			color = Color("#9b9b9b")
		type.SEA:
			color = Color("#00abff")
			up = [type.SEA, type.COAST]
			down = [type.SEA]
			left = [type.SEA, type.COAST]
			right = [type.SEA, type.COAST]
		type.COAST:
			color = Color("#f3d472")
			up = [type.LAND, type.COAST]
			down = [type.SEA, type.COAST]
			left = [type.SEA, type.COAST, type.LAND]
			right = [type.SEA, type.COAST, type.LAND]
		type.LAND:
			color = Color("#63b834")
			up = [type.LAND]
			down = [type.COAST, type.LAND]
			right = [type.COAST, type.LAND]
			left = [type.COAST, type.LAND]

func getEntrophy():
	if options.size() == 0:
		return 4
	return options.size()

func collapse():
	if options.size() == 0:
		return 
	var c = options[rnd.randf_range(0, options.size())]
	Tiletype = c
	options.clear()
	setTile()
