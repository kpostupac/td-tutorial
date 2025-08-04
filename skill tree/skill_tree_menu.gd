extends Control

var skills = {}

func _ready():
	# Find all SkillButtons and store them by name
	for child in get_children():
		if child is Button and "BackButton" not in child.name:
			skills[child.skill_name] = child
			child.pressed.connect(on_skill_pressed.bind(child))

func on_skill_pressed(skill_button):
	if can_unlock(skill_button):
		skill_button.is_unlocked = true
		skill_button.update_visual()

func can_unlock(skill_button):
	for required_name in skill_button.required_skills:
		if not skills.has(required_name):
			return false
		if not skills[required_name].is_unlocked:
			return false
	return true
