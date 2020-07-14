extends Camera2D

var rand := RandomNumberGenerator.new()
var shaking_position := false
var shaking_rotation := false
var shaking_zoom := false
var magnitude_position := 0.0
var magnitude_rotation := 0.0
var magnitude_zoom := 0.0

export (NodePath) onready var timer_position = get_node(timer_position) as Timer 
export (NodePath) onready var timer_rotation = get_node(timer_rotation) as Timer 
export (NodePath) onready var timer_zoom = get_node(timer_zoom) as Timer 
export (NodePath) onready var tween = get_node(tween) as Tween 

func _process(delta) -> void:
	if shaking_position or magnitude_rotation or magnitude_zoom:
		rand.randomize()
		if shaking_position:
			position = Vector2(2 * rand.randf() - 1, 2 * rand.randf() - 1).normalized() * magnitude_position
		if magnitude_rotation:
			rotation = (2 * rand.randf() - 1) * magnitude_rotation
		if magnitude_zoom:
			zoom = Vector2(2 * rand.randf() - 1, 2 * rand.randf() - 1).normalized() * magnitude_zoom + Vector2(1,1) 

func shake_position(ss_magnitude = 5, ss_duration = 0.5, transition_type = Tween.TRANS_EXPO, ease_type = Tween.EASE_OUT) -> void:
	tween.interpolate_property(self, "magnitude_position", ss_magnitude, 0, ss_duration, transition_type, ease_type)
	tween.start()
	timer_position.wait_time = ss_duration
	timer_position.start()
	shaking_position = true

func shake_rotation(ss_magnitude = 5, ss_duration = 0.5, transition_type = Tween.TRANS_EXPO, ease_type = Tween.EASE_OUT) -> void:
	tween.interpolate_property(self, "magnitude_rotation", ss_magnitude, 0, ss_duration, transition_type, ease_type)
	tween.start()
	timer_rotation.wait_time = ss_duration
	timer_rotation.start()
	shaking_rotation = true

func shake_zoom(ss_magnitude = 5, ss_duration = 0.5, transition_type = Tween.TRANS_EXPO, ease_type = Tween.EASE_OUT) -> void:
	tween.interpolate_property(self, "magnitude_zoom", ss_magnitude, 0, ss_duration, transition_type, ease_type)
	tween.start()
	timer_zoom.wait_time = ss_duration
	timer_zoom.start()
	shaking_zoom = true

func _on_TimerPostion_timeout() -> void:
	shaking_position = false

func _on_TimerRotation_timeout() -> void:
	shaking_rotation = false

func _on_TimerZoom_timeout() -> void:
	magnitude_zoom = false
