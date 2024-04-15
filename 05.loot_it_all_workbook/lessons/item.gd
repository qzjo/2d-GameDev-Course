extends Area2D

func _on_area_entered(area_that_entered: Area2D) -> void:
	queue_free()
	
func _ready() -> void:
	
	play_floating_animation()
	area_entered.connect(_on_area_entered)
	
func play_floating_animation() -> void:
	var tween := create_tween()
	var sprite_2d := get_node("Sprite2D")
	tween.set_trans(Tween.TRANS_SINE)
		
	var pos_offset := Vector2(0.0, 4.0)
	var duration := randf_range(0.8, 1.2)
	
	sprite_2d.position.y = -1.0 * pos_offset.y
	tween.tween_property(sprite_2d, "position", pos_offset, duration)
	tween.tween_property(sprite_2d, "position", -1.0 * pos_offset, duration)
	tween.set_loops()

	

