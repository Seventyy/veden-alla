extends Node2D

func _ready() -> void:
	Signals.connect("spawn_audio_stream_player2d", self, "add_child")
