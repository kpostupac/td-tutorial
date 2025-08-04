extends CharacterBody2D

@export var speed=200
var health = 20

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_parent().progress += speed*delta
	#this is if the soldier has made it through the stage
	if get_parent().progress_ratio == 1:
		queue_free()
		GameManager.on_enemy_escaped()
	
	#if the enemy dies
	if health <= 0:
		GameManager.on_enemy_died()
		get_parent().get_parent().queue_free()
