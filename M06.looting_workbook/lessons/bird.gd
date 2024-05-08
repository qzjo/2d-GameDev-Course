extends Node2D

@onready var brd := $Bird
@onready var shdw := $Shadow2
@onready var tim := $timr


func _ready() -> void:
	tim.wait_time =randf_range(1.0, 3.0)
	tim.one_shot = true
	tim.timeout.connect(_animate_hop)
	tim.start()
	
	
	
func _animate_hop() -> void:
	
	const hop_duration := 0.25
	const half_hop_duration := hop_duration / 2.0
	
	var random_direcction := Vector2(1.0, 0.0).rotated(randf() * 2.0 * PI)
	var landing_pos := random_direcction * randf_range(0.0 ,30.0)
	
	var tween := create_tween().set_parallel()
	tween.tween_property(brd, "position:x", landing_pos, hop_duration)
	
	tween.tween_property(shdw, "position", landing_pos, hop_duration)
	
	tween = create_tween()
	
	tween.set_trans(tween.TRANS_QUAD)
	tween.set_ease(tween.EASE_OUT)
	const jmp_height := 16.0
	
	tween.tween_property(brd, "position:y", landing_pos.y - jmp_height, half_hop_duration)
	tween.set_ease(Tween.EASE_IN)
	tween.tween_property(brd, "position:y", landing_pos.y, half_hop_duration)
	
	tim.wait_time = randf_range(1.0, 3.0)
	
	tween.finished.connect(tim.start)
	
	



