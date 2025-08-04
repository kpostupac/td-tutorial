extends Button

func _on_pressed() -> void:
	print("I want to go back")
	get_tree().change_scene_to_file("res://main.tscn")
