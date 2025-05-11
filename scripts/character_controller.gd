extends CharacterBody3D

@export var charcter_speed = 10
@export var acceleration = 0.1
@export var friction = 0.1

# can change this to use a timer
@export var invincible_interval = 3
var invincible_time = invincible_interval

var got_hit = false

func _ready():
	Globals.connect("character_hit", self._on_hit)

func _physics_process(_delta: float) -> void:
	var direction = _get_input()
	
	self.position.z = clamp(self.position.z, -6, 6)
	self.position.x = clamp(self.position.x, -10, 11)
	
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * charcter_speed, acceleration)
	else:
		velocity = velocity.lerp(Vector3.ZERO, friction)
	
	move_and_slide()

func _process(delta):
	_process_on_hit(delta)

func _get_input() -> Vector3:
	var vertical = Input.get_axis("ui_up", "ui_down")
	var horizontal = Input.get_axis("ui_left", "ui_right")
	return Vector3(vertical, 0, -horizontal)

func _on_hit() -> void:
	got_hit = true
	Globals.lives -= 1
	start_blinking()
	
func _process_on_hit(delta):
	if got_hit:
		$CollisionShape3D.disabled = true
		invincible_time -= delta
		if invincible_time <= 0:
			$CollisionShape3D.disabled = false
			got_hit = false
			invincible_time = invincible_interval
			
func start_blinking():
	var timer := 0.0
	var interval := 0.1
	while timer < invincible_interval:
		$Knight.visible = false
		await get_tree().create_timer(interval).timeout
		$Knight.visible = true
		await get_tree().create_timer(interval).timeout
		timer += interval * 2
