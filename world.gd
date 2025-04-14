extends Node2D
@onready var tile_map: TileMap = $TileMap
@onready var camera_2d: Camera2D = $player/Camera2D
func _ready() -> void:
	var used:=tile_map.get_used_rect().grow(-1)
	var tile_size:=tile_map.tile_set.tile_size
	
