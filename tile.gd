extends ColorRect

@export var type = tileType.type.EMPTY 
var options = {tileType.type.SEA: true, tileType.type.COAST: true, tileType.type.LAND: true}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match type:
		tileType.type.EMPTY:
			color = Color("#FFFFFF")
		tileType.type.SEA:
			color = Color("#00abff")
		tileType.type.COAST:
			color = Color("#f3d472")
		tileType.type.LAND:
			color = Color("#76da43")

func countValidOptions():
	var count = 0
	for i in range(0, options.values().size()):
		if options.values()[i] == true:
			count+= 1
	return count
