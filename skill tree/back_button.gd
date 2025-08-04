#this is the back button from the skill tree menu 
#to go back to the start menu

extends Button

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://start_menu.tscn")
