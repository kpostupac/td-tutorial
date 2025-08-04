extends Button

#this will switch to the main scene, so you can start the game.
func _on_pressed() -> void:
	GameManager.base_health = 3
	GameManager.player_currency = 100
	get_tree().change_scene_to_file("res://main.tscn")
