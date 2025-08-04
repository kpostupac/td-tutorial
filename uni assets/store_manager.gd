extends Node

var grid_size = 64

func is_valid_placement(position: Vector2, tilemap) -> bool:
	var tile_coords = tilemap.local_to_map(position)
	
	var tile_id = tilemap.get_cell_source_id(0, tile_coords)
	
	if tile_id == -1:
		return false  # no tile

	var tile_data: TileData = tilemap.get_cell_tile_data(0, tile_coords)

	if tile_data.has_custom_data("placeable") and tile_data.get_custom_data("placeable") == false:
		return false

	return true

func on_place_tower(path, temp_tower, tower_price, event_pos):
	path.add_child(temp_tower)
	temp_tower.global_position = event_pos
	temp_tower.get_node("Placement Area").hide()
	GameManager.on_tower_bought(tower_price)
