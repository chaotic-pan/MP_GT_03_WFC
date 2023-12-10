extends Node2D
var matrix=[]
var rnd = RandomNumberGenerator.new()
var finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	# why tf does godot not have 2-dimensional arrays i am going to scream
	for x in range(10):
		matrix.append([])
		matrix[x]=[]	
		for y in range(10):
			matrix[x].append([])
			matrix[x][y] = get_node(str(x)+str(y))
			matrix[x][y].pos = Vector2(x,y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if finished:
		return
	var tile = getLowestEntrophy()
	tile.collapse()
	var x = tile.pos.x
	var y = tile.pos.y
	if x > 0:
		propagation(tile, matrix[x-1][y])
	if x < 9:
		propagation(tile, matrix[x+1][y])
	if y > 0:
		propagation(tile, matrix[x][y-1])
	if y < 9:
		propagation(tile, matrix[x][y+1])

func getLowestEntrophy():
	var min = 4
	var minTiles = []
	
	for x in range(10):
		for y in range(10):
			var a = matrix[x][y].getEntrophy()
			if a==min:
				minTiles.append(matrix[x][y])
			elif a < min:
				min = a
				minTiles.clear()
				minTiles.append(matrix[x][y])
	if minTiles[0].getEntrophy() == 0:
		finished = true
	return minTiles[rnd.randf_range(0, minTiles.size())]

func propagation(tile, neighbor):
	var connections = tile.neighbors
	var possible = neighbor.options
	var newPoss = []
	
	#for each options in neigbor
	for p in range(possible.size()):
		var poss = possible[p]
		#if option is in tile.neigbors
		if  connections.find(poss) > -1:
			newPoss.append(poss)
	neighbor.options = newPoss
