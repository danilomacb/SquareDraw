extends TileMap

var tile_size = 16
var tile_atlas_coord = Vector2i(0, 0)

var tile_start_pos
var current_tile_pos

var direction_right
var direction_down

func _process(delta):
	if Input.is_action_just_pressed("left_mouse_button"):
		tile_start_pos = get_global_mouse_position() / tile_size
		set_cell(0, tile_start_pos, 2, tile_atlas_coord)
		
	if Input.is_action_pressed("left_mouse_button"):
		current_tile_pos = get_global_mouse_position() / tile_size
		
		var lines_quantity = 0
		var columns_quantity = 0
		
		if current_tile_pos.x > tile_start_pos.x:
			direction_right = true
			lines_quantity = current_tile_pos.x - tile_start_pos.x
		else:
			direction_right = false
			lines_quantity = tile_start_pos.x - current_tile_pos.x
		
		if current_tile_pos.y > tile_start_pos.y:
			direction_down = true
			columns_quantity = current_tile_pos.y - tile_start_pos.y
		else:
			direction_down = false
			columns_quantity = tile_start_pos.y - current_tile_pos.y
		
		var tile_coord_x = 0
		var tile_coord_y = 0
		
		for c in columns_quantity:
			for l in lines_quantity:
				if direction_right:
					tile_coord_x = tile_start_pos.x + l
				else:
					tile_coord_x = tile_start_pos.x - l
				
				if direction_down:
					tile_coord_y = tile_start_pos.y + c
				else:
					tile_coord_y = tile_start_pos.y - c
				
				set_cell(0, Vector2i(tile_coord_x, tile_coord_y), 2, tile_atlas_coord)
