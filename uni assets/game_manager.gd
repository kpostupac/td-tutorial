extends Node

var std_base_health := 3
var std_player_currency := 100

var base_health = std_base_health
var player_currency = std_player_currency

func on_enemy_escaped():
	base_health -= 1
	#if you have run out of base_health
	if base_health <= 0:
		get_tree().change_scene_to_file("res://start_menu.tscn")

func on_enemy_died():
	player_currency += 10
	
func on_tower_bought(currency_amount: int):
	player_currency -= currency_amount
	
func on_game_begin():
	base_health = std_base_health
	player_currency = std_player_currency
