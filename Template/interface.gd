extends Control

export(String, FILE, "*.scn, *.tscn") var initial_interface := ""

var current_interface: Control = null

func _ready() -> void:
	Signals.connect("change_interface", self, "_change_interface")
	
	_add_initial_interface()

func _add_initial_interface() -> void:
	if not ResourceLoader.exists(initial_interface, "PackedScene"):
		return
	
	var initial_scene_packed := ResourceLoader.load(initial_interface, "PackedScene") as PackedScene
	_change_interface(initial_scene_packed.instance() as Control)

func _change_interface(new_interface: Control) -> void:
	if not new_interface:
		return
	
	if current_interface:
		current_interface.queue_free()
	
	add_child(new_interface)
	current_interface = new_interface
