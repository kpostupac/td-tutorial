extends Node

var base_health := 10
var player_currency := 100

func on_enemy_escaped():
	base_health -= 1
	if base_health <= 0:
		#TODO: end the game
		pass

func on_enemy_died():
	player_currency += 10
	
func tower_bought(currency_amount: int):
	player_currency += currency_amount
