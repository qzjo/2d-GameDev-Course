extends Node2D

var collectible_scenes := [
	preload("coin.tscn"), preload("energy_pack.tscn")
]


func _ready() -> void:
	get_node("Timer").timeout.connect(_on_timer_timeout)


func _on_timer_timeout() -> void:
	var random_collectable_scene: PackedScene = collectible_scenes.pick_random()
	var collectible_instance := random_collectable_scene.instantiate()
	add_child(collectible_instance)



