extends Node2D
# KEY may appeare in any direction next to VALUE
var rules = {
			tileType.type.SEA:tileType.type.COAST,
			tileType.type.COAST:tileType.type.SEA,
			#tileType.type.COAST:tileType.type.LAND,
			tileType.type.LAND:tileType.type.COAST
			}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
