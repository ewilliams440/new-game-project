extends TileMap

class_name tile_map

@export var rows = 10
@export var columns = 20
@export var mines = 20
@export var x_offset = 7
@export var y_offset = 3

const TILESET_ID = 0
const DEFAULT_LAYER = 0
const CELLS = {
	"1": Vector2i(2,2),
	"2": Vector2i(2,3),
	"3": Vector2i(1,3),
	"4": Vector2i(1,2),
	"5": Vector2i(3,1),
	"6": Vector2i(0,3),
	"7": Vector2i(3,2),
	"UNKNOWN": Vector2i(3,3),
	"CLEAR": Vector2i(2,1),
	"FLAGGED": Vector2i(0,2),
	"BOMB": Vector2i(0,1)
}

func _ready():
	clear_layer(DEFAULT_LAYER)
	for i in rows:
		for j in columns:
			set_tile_cell(i,j,"UNKNOWN")
			
func set_tile_cell(r, c, cell_type):
	#var cell_coords = Vector2(r-rows/2,c-columns/2)
	var cell_coords = Vector2(y_offset + r,x_offset + c)
	set_cell(DEFAULT_LAYER, cell_coords, TILESET_ID, CELLS[cell_type])
	
