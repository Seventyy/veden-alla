extends AudioStreamPlayer2D

class_name OneShotAudioStreamPlayer2D

func _init(audio_stream = null):
	if audio_stream != null:
		stream = audio_stream

func _ready():
	play()
	yield(self, "finished")
	queue_free()
