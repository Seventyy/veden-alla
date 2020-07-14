extends AudioStreamPlayer2D

class_name OneShotAudioStreamPlayer2D

func _init(audio_stream: AudioStream = null, point := get_viewport_rect().size/2) -> void:
	if audio_stream != null:
		stream = audio_stream
		position = point

func _ready() -> void:
	play()
	yield(self, "finished")
	queue_free()
