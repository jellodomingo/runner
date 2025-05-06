extends Node
class_name TrackController

@export var track_velocity = 10
@export var track_end = -48
@export var track_start = 31.5

var Tiles: Array[Node3D] = []

func _ready() -> void:
	_load_tiles()

func _physics_process(delta: float) -> void:
	_move_track(delta)

func _move_track(delta: float) -> void:
	for tile in Tiles:
		if(tile.position.x < track_end):
			tile.position.x = track_start
		tile.position.x -= track_velocity * delta
	
func _load_tiles() -> void:
	for children in self.get_children():
		Tiles.append(children)
