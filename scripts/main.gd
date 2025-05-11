extends Node3D

func _process(_delta: float) -> void:
	$GameUI.update_ui()
	if(Globals.lives <= 0):
		get_tree().paused = true
		
