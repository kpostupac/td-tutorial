extends Node

var base_health := 10
var player_money := 100

func on_enemy_escaped():
	print("Enemy Escaped!")
	base_health -= 1
	if base_health <= 0:
		print("Game Over")
