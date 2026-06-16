extends Control

func _ready():
	$Forward.button_down.connect(_forward_down)
	$Forward.button_up.connect(_forward_up)

	$Backward.button_down.connect(_backward_down)
	$Backward.button_up.connect(_backward_up)

	$Left.button_down.connect(_left_down)
	$Left.button_up.connect(_left_up)

	$Right.button_down.connect(_right_down)
	$Right.button_up.connect(_right_up)

func _forward_down():
	Input.action_press("move_forward")

func _forward_up():
	Input.action_release("move_forward")

func _backward_down():
	Input.action_press("move_backward")

func _backward_up():
	Input.action_release("move_backward")

func _left_down():
	Input.action_press("move_left")

func _left_up():
	Input.action_release("move_left")

func _right_down():
	Input.action_press("move_right")

func _right_up():
	Input.action_release("move_right")
