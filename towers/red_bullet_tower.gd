extends StaticBody2D

var Bullet = preload("res://towers/bullet.tscn")
var bullet_damage = 10
var path_name
#all targets in range
var current_targets = []
#the current target
var current

func _process(delta: float) -> void:
	if is_instance_valid(current):
		self.look_at(current.global_position)
	else:
		for i in get_node("BulletContainer").get_child_count():
			get_node("BulletContainer").get_child(i).queue_free()

#when an enemy enters the tower's range
func _on_tower_body_entered(body: Node2D) -> void:
	#if it is a soldier
	if "Soldier A" in body.name:
		var temp_array = []
		#grab all of the soldiers in the tower's range
		current_targets = get_node("Tower Range").get_overlapping_bodies()
		
		for i in current_targets:
			if "Soldier" in i.name:
				temp_array.append(i)
		
		var temp_curr_target = null
		
		for i in temp_array:
			if temp_curr_target == null:
				temp_curr_target = i.get_node("../")
			else:
				if i.get_parent().progress > temp_curr_target.progress:
					temp_curr_target = i.get_node("../")
					
		current = temp_curr_target
		path_name = temp_curr_target.get_parent().name
		
		var temp_bullet = Bullet.instantiate()
		#var path_name is defined in bullet.gd
		temp_bullet.path_name = path_name
		#var bullet_damage is defined in bullet.gd
		temp_bullet.bullet_damage = bullet_damage
		get_node("BulletContainer").add_child(temp_bullet)
		temp_bullet.global_position = $Aim.global_position

		
func _on_tower_body_exited(body: Node2D) -> void:
	current_targets = get_node("Tower Range").get_overlapping_bodies()
