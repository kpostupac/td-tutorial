extends Label

func _ready():
	text = "Skill Points: %d" % SaveManager.skill_points
