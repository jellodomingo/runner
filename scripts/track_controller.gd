extends Node
class_name TrackController

var TileObject = preload("res://gameObjects/Tile.tscn")

@export var track_end = -48
@export var track_start = 31.5

var tiles: Array[Node3D] = []

func _ready() -> void:
	_load_starting_tiles()

func _physics_process(delta: float) -> void:
	_update_track(delta)

func _update_track(delta: float) -> void:
	for tile in tiles:
		if(tile.position.x < track_end):
			# delete tiles when they reach the end of track
			tile._delete()
			tiles.erase(tile)
			# spawn in new tiles at the front
			var new_tile = TileObject.instantiate()
			new_tile.position.x = track_start
			tiles.append(new_tile)
			add_child(new_tile)
		else:
			tile.position.x -= Globals.track_velocity * delta
	
	
	
func _load_starting_tiles() -> void:
	for child in self.get_children():
		if child is Tile:
			tiles.append(child)
