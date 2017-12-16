extends Panel

signal load_screen(name)

export(String) var next_screen = ""

func _on_next_screen_pressed():
	if next_screen == null || next_screen == "":
		print("Next screen not defined")
		return

	emit_signal("load_screen", next_screen)
