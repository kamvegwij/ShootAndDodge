extends Area2D

onready var hold = $joystickhold
onready var moveable_btn = $joystickhold/joystickmoveable
onready var max_distance = $CollisionShape2D.shape.radius

var touched: bool = false
		
func _process(delta):
	if touched:
		moveable_btn.global_position = get_global_mouse_position()
		moveable_btn.position = hold.position + (moveable_btn.position - hold.position).clamped(max_distance)
		
func _input(event):
	if event is InputEventScreenTouch:
		var distance = event.position.distance_to(hold.global_position)
		
		if !touched:
			if distance < max_distance: 
				touched = true
			
		else: 
			moveable_btn.position = Vector2(0, 0)
			touched = false
			
func get_angle():
	var angle_joystick = atan2(moveable_btn.position.y,moveable_btn.position.x)
	return rad2deg(angle_joystick)
