extends CharacterBody3D

@export var speed: float = 5.0
@export var mouse_sensitivity: float = 0.002
@export var touch_sensitivity: float = 0.005

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var pitch: float = 0.0

@onready var head: Node3D = $Head

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		look(event.relative * mouse_sensitivity)

	if event is InputEventScreenDrag:
		look(event.relative * touch_sensitivity)

	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func look(relative_motion: Vector2) -> void:
	rotate_y(-relative_motion.x)

	pitch -= relative_motion.y
	pitch = clamp(pitch, deg_to_rad(-80), deg_to_rad(80))
	head.rotation.x = pitch

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta

	var input_dir := Input.get_vector(
		"move_left",
		"move_right",
		"move_forward",
		"move_backward"
	)

	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	move_and_slide()
