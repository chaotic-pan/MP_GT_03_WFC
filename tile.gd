extends ColorRect

@export var type = tileType.type.EMPTY 
var options = [tileType.type.SEA, tileType.type.COAST, tileType.type.LAND]
var neighbors = []
var rnd = RandomNumberGenerator.new()
var pos = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	setTile()

func setTile():
	match type:
		tileType.type.EMPTY:
			color = Color("#9b9b9b")
			neighbors = []
		tileType.type.SEA:
			color = Color("#00abff")
			neighbors = [tileType.type.SEA, tileType.type.COAST]
		tileType.type.COAST:
			color = Color("#f3d472")
			neighbors = [tileType.type.SEA, tileType.type.COAST, tileType.type.LAND]
		tileType.type.LAND:
			color = Color("#63b834")
			neighbors = [tileType.type.COAST, tileType.type.LAND]

func getEntrophy():
	if type != tileType.type.EMPTY:
		return 4
	return options.size()

func collapse():
	if type != tileType.type.EMPTY:
		return 
	var c = options[rnd.randf_range(0, options.size())]
	type = c
	options.clear()
	setTile()
