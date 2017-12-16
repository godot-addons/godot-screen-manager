extends Node

signal screen_loaded(name)

var _screen_path = NodePath("/root/screen")
var _screens = {}

"""
Set the NodePath for the node holding the screen.
"""
func set_screen_path(node_path):
	_screen_path = NodePath(node_path)

"""
Set the screens dictionary which is key as a screen name and value of the resource URL to the scene.
"""
func set_screens(screens):
	_screens = screens

"""
Load the screen by it's key name
"""
func load_screen(name):
	print("Load screen: ", name)

	if !(name in _screens):
		print("[ERROR] Cannot load screen: ", name)
		return

	var screen = get_node(_screen_path)

	# Remove all children of screen nod
	for child in screen.get_children():
		if child.has_method("unload"):
			child.unload()

		screen.remove_child(child)

	# Create next scene object then add to scene tree
	var next_screen = load(_screens[name]).instance()
	screen.add_child(next_screen)

	emit_signal("screen_loaded", name)
