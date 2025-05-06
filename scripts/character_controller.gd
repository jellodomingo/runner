extends CharacterBody3D

@export var charcter_speed = 10
@export var acceleration = 0.1
@export var friction = 0.1

func _physics_process(delta: float) -> void:
	var direction = get_input()
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * charcter_speed, acceleration)
	else:
		velocity = velocity.lerp(Vector3.ZERO, friction)
	move_and_slide()

func get_input():
	var vertical = Input.get_axis("ui_up", "ui_down")
	var horizontal = Input.get_axis("ui_left", "ui_right")
	return Vector3(vertical, self.position.y, -horizontal)
