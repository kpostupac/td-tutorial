extends Node

var base_health := 3
var player_currency := 100

func on_enemy_escaped():
	base_health -= 1
	
	#if you have run out of base_health
	if base_health <= 0:
		get_tree().change_scene_to_file("res://start_menu.tscn")

func on_enemy_died():
	player_currency += 10
	
func tower_bought(currency_amount: int):
	player_currency += currency_amount
