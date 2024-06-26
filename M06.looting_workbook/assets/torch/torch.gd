extends Node2D


@onready var flame: Sprite2D = $Flame


func _ready() -> void:
	# This parameter of the shader material gives each flame a slightly different look and randomized animation.
	flame.material.set("shader_parameter/offset", global_position * 0.1)

func toggle_target_node_visiblility() -> void:
	flame.visible = not flame.visible

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	var event_mouse_is_clicked: bool = (
		event is InputEventMouseButton and 
		event.button_index == MOUSE_BUTTON_LEFT and
		event.is_pressed()
	)
	
	if event_mouse_is_clicked:
		print("LOL")
		toggle_target_node_visiblility()
		

