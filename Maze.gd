extends Node2D
var Number:int = 6
var root_node: Branch
var tile_size: int =  16
var world_size = Vector2i(500,300)

var tilemap: TileMap
var paths: Array = []

func _draw():
	var rng = RandomNumberGenerator.new()
	for leaf in root_node.get_leaves():
		var padding = Vector4i(rng.randi_range(2,3),rng.randi_range(2,3),rng.randi_range(2,3),rng.randi_range(2,3))
		for x in range(leaf.size.x):
			for y in range(leaf.size.y):
				if not is_inside_padding(x,y, leaf, padding) :
					const NEIGHBORS := [
					Vector2i.LEFT,
					Vector2i.RIGHT,
					Vector2i.UP,
					Vector2i.DOWN,
					Vector2i(-1, -1),
					Vector2i(-1, 1),
					Vector2i(1, -1),
					Vector2i(1, 1)
					]
					var cells := {}
					cells[Vector2i(x + leaf.position.x,y + leaf.position.y)] = null	
					for neighbor in NEIGHBORS:
						cells[Vector2i(x + leaf.position.x,y + leaf.position.y) + neighbor] = null
				
					tilemap.set_cells_terrain_connect(0, cells.keys(), 0, 0)
	for path in paths:
		if path['left'].y == path['right'].y:
			for i in range(path['right'].x - path['left'].x):
				const NEIGHBORS := [
					Vector2i.LEFT,
					Vector2i.RIGHT,
					Vector2i.UP,
					Vector2i.DOWN,
					Vector2i(-1, -1),
					Vector2i(-1, 1),
					Vector2i(1, -1),
					Vector2i(1, 1)
					]
				var cells := {}
				cells[Vector2i(path['left'].x+i,path['left'].y)] = null	
				for neighbor in NEIGHBORS:
					cells[Vector2i(path['left'].x+i,path['left'].y) + neighbor] = null
				
				tilemap.set_cells_terrain_connect(0, cells.keys(), 0, 0)
		else:
			for i in range(path['right'].y - path['left'].y):
				const NEIGHBORS := [
					Vector2i.LEFT,
					Vector2i.RIGHT,
					Vector2i.UP,
					Vector2i.DOWN,
					Vector2i(-1, -1),
					Vector2i(-1, 1),
					Vector2i(1, -1),
					Vector2i(1, 1)
					]
				var cells := {}
				cells[Vector2i(path['left'].x,path['left'].y+i)] = null	
				for neighbor in NEIGHBORS:
					cells[Vector2i(path['left'].x,path['left'].y+i) + neighbor] = null
				
				tilemap.set_cells_terrain_connect(0, cells.keys(), 0, 0)
				print(tilemap.get_cell_atlas_coords(0, Vector2i(path['left'].x,path['left'].y+i), false ))
				
func _ready():
	tilemap = get_node("TileMap")
	root_node  = Branch.new(Vector2i(0,0), world_size)
	root_node.split(7 , paths)
	queue_redraw()
	pass 


func is_inside_padding(x, y, leaf, padding):
	return x <= padding.x or y <= padding.y or x >= leaf.size.x - padding.z or y >= leaf.size.y - padding.w
