extends Button

@export var skill_name: String = "IncreaseTowerSpeed"
@export var is_unlocked: bool = false
@export var required_skills: Array[String] = []

func _ready():
	update_visual()

func update_visual():
	self.disabled = not is_unlocked
	if is_unlocked:
		var bg = StyleBoxFlat.new()
		bg.bg_color = Color.WHITE
		add_theme_stylebox_override("normal", bg)
	else:
		var bg = StyleBoxFlat.new()
		bg.bg_color = Color.GRAY
		add_theme_stylebox_override("normal", bg)
