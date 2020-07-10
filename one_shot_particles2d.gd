extends Particles2D

class_name OneShotParticles2D

func _ready():
	one_shot = true
	explosiveness = 1.0
	emitting = true
	yield(get_tree().create_timer(lifetime), "timeout")
	emitting = false
	queue_free()
