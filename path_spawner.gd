extends Node2D

@onready var path =preload("res://stages/stage 1.tscn")

func _on_timer_timeout() -> void:
	var TempPath = path.instantiate()
	add_child(TempPath)
