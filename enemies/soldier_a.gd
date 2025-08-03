extends CharacterBody2D

@export var speed=200
var health = 20

#TODO: I want to add a health bar to my enemies

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_parent().progress += speed*delta
	if get_parent().progress_ratio == 1:
		queue_free()

	if health <= 0:
		get_parent().get_parent().queue_free()
