extends Node2D

@onready var path =preload("res://stages/stage 1.tscn")
#this controls the wave of first soldiers
var max_soldier_a_count = 10
var soldier_a_count = 0

func _on_timer_timeout() -> void:
	if soldier_a_count >= max_soldier_a_count:
		get_node("Timer").stop()
		return
	
	var TempPath = path.instantiate()
	add_child(TempPath)
	soldier_a_count += 1
