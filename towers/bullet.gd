extends CharacterBody2D

var target 
var speed = 500
var path_name = ""
var bullet_damage

func _physics_process(delta: float) -> void:
	var path_spawner = get_tree().get_root().get_node("Main/PathSpawner")
	
	for i in path_spawner.get_child_count():
		if path_spawner.get_child(i).name == path_name:
			target = path_spawner.get_child(i).get_child(0).get_child(0).global_position
	
	velocity = global_position.direction_to(target) * speed
	
	look_at(target)
	
	#when the enemy has died before this bullet reaches him
	if target == null:
		queue_free()
	
	move_and_slide()
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if "Soldier A" in body.name:
		body.health -= bullet_damage
		queue_free()
