extends Sprite2D

var max_speed := 600.0
var velocity := Vector2(0, 0)
var steering_factor := 10.0


func _process(delta: float) -> void:
	var direction := Vector2(0, 0)
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")

	if direction.length() > 1.0:
		direction = direction.normalized()

	var desired_velocity := max_speed * direction
	var steering_velocity := desired_velocity - velocity
	velocity += steering_velocity * steering_factor * delta
	position += velocity * delta

	if direction.length() > 0.0:
		rotation = velocity.angle()
