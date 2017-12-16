extends Resource

var _file_path

"""
Constructor accepting resource URL to config file
"""
func _init(file_path):
	_file_path = file_path

"""
Create configuration using ConfigFile.
@return dictionary of screen_name to scene path
"""
func create():
	var config_file = ConfigFile.new()
	if config_file.load(_file_path) != OK:
		print("Error loading config file")
		return {}

	var screens = {}
	for key in config_file.get_section_keys("screens"):
		print("Screen config: key=", key)
		screens[key] = str(config_file.get_value("screens", key))

	config_file.close()
	
	return screens
