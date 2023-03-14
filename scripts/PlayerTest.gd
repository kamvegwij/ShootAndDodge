extends KinematicBody2D

export var speed = 100
export var fall_acc = 60

export (NodePath) onready var joystick = get_node(joystick)

var velocity = Vector2.ZERO

func _ready():
	GameManager.player = self
	
func _physics_process(delta):
	move_player(delta)
	_rotate_arrow()
func _rotate_arrow():
	$arrow.rotation_degrees = joystick.get_angle()
	
func move_player(d):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		pass
	if Input.is_action_pressed("ui_down"):
		pass
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		
	direction = direction.normalized()
	velocity.x = direction.x*speed*d
	velocity.y = direction.y*speed*d
	
	#move
	move_and_slide(velocity*speed)
