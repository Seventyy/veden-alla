extends Node2D

export(String, FILE, "*.scn, *.tscn") var initial_level := ""

var current_level: Node = null

func _ready() -> void:
	Signals.connect("change_level", self, "_change_level")

func _add_initial_level() -> void:
	if not ResourceLoader.exists(initial_level, "PackedScene"):
		return
	
	var initial_level_packed := ResourceLoader.load(initial_level) as PackedScene
	_change_level(initial_level_packed.instance() as Node)

func _change_level(new_level: Node) -> void:
	if not new_level:
		return
	
	if current_level:
		current_level.queue_free()
	
	add_child(new_level)
	current_level = new_level
