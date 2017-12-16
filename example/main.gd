extends Node2D

onready var _screen_manager = get_tree().get_root().get_node("/root/screen_manager")

func _ready():
	_screen_manager.set_screen_path("/root/main/screen")
	_screen_manager.set_screens({
		"screen1": "res://screen1.tscn",
		"screen2": "res://screen2.tscn",
		"screen3": "res://screen3.tscn"
	})

	load_screen("screen1")

func load_screen(name):
	_screen_manager.load_screen(name)

	for i in $screen.get_children():
		i.connect("load_screen", self, "load_screen")
