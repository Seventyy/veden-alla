extends Node2D

func _ready() -> void:
	Signals.connect("spawn_particles2d", self, "add_child")
