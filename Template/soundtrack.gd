extends AudioStreamPlayer

func _ready() -> void:
	Signals.connect("change_soundtrack", self, "change_soundtrack")

func _change_soundtrack(audio_stream: AudioStream) -> void:
	if not audio_stream:
		return
	
	stop()
	stream = audio_stream
	play()
