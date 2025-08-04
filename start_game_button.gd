extends Button

#this will switch to the main scene, so you can start the game.
func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
