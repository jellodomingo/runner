extends Area3D
class_name Obstacle

var rng = RandomNumberGenerator.new()
var already_hit = false

func _ready() -> void:
	_get_random_model()
	connect("body_entered", self._on_body_entered)
	
func _get_random_model() -> void:
	var model = rng.randi_range(1,3)
	$keg2.visible = model == 1
	$box_stacked2.visible = model == 2
	$table_long_broken2.visible = model == 3
	
	
func _on_body_entered(body) -> void:
	if(body.name == "Character" and not already_hit):
		Globals.emit_signal("character_hit")
		already_hit = true
