extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Base Health: %d" % GameManager.base_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "Base Health: %d" % GameManager.base_health
