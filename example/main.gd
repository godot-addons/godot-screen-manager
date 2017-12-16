extends Node2D

# Screen manager is an autoloaded singleton (see project settings)
onready var _screen_manager = get_tree().get_root().get_node("/root/screen_manager")

func _ready():
	# Set the node path to our screen holding node
	_screen_manager.set_screen_path("/root/main/screen")

	# Set the available screens
	_screen_manager.set_screens({
		"screen1": "res://screen1.tscn",
		"screen2": "res://screen2.tscn",
		"screen3": "res://screen3.tscn"
	})

	# On game start, load screen1 as the default
	load_screen("screen1")

func load_screen(name):
	_screen_manager.load_screen(name)

	# Example showing us connecting the loaded screen's "load_screen" signal to our handler.
	# This could also just connect directly to load_screen for simplicity.
	# Instead of connecting a signal, the screens could just reference the screen_manager directly as a singleton
	for i in $screen.get_children():
		if i.has_user_signal("load_screen"):
			i.connect("load_screen", self, "_on_load_screen")

func _on_load_screen(name):
	load_screen(name)
