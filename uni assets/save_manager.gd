extends Node

var save_path := "user://savegame.json"
var unlocked_skills: Array[String] = []
var completed_levels: Array[String] = []
var skill_points: int = 0

func save_game():
	var data = {
		"unlocked_skills": unlocked_skills,
		"completed_levels": completed_levels,
		"skill_points": skill_points
	}
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()

func load_game() -> Dictionary:
	if not FileAccess.file_exists(save_path):
		return {}
	var file = FileAccess.open(save_path, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	return JSON.parse_string(content) as Dictionary
	
func reset_save():
	# Remove the save file if it exists
	if FileAccess.file_exists(save_path):
		DirAccess.remove_absolute(save_path)
	
	# Reset in-memory values
	unlocked_skills = []
	completed_levels = []
	skill_points = 0
