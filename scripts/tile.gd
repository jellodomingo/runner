extends Node3D

class_name Tile

var rng = RandomNumberGenerator.new()
var ObstacleObject = preload("res://gameObjects/Obstacle.tscn")

func _ready() -> void:
	var new_obstacle = ObstacleObject.instantiate()
	new_obstacle.position = _get_random_spawn_position()
	add_child(new_obstacle)

func _get_random_spawn_position() -> Vector3:
	# Get random x between 0 and 16
	# Get random z between -8 and 8
	var x = rng.randi_range(6, 11)
	var z = rng.randi_range(-4, 4)
	return Vector3(x, 0, z);
	
func _delete() -> void:
	Globals.score += 1
	queue_free()
#func _physics_process(delta: float) -> void:
	#
