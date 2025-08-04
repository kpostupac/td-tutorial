extends Panel

@onready var tower = preload("res://towers/red_bullet_tower.tscn")

var current_tile
var grid_size = 64
#this is the price of the red bullet tower
var tower_price = 25

#I had to set the custom minimium sizing here
#if i just set the basic size property, the on_click 
#was not detected
func _on_gui_input(event: InputEvent) -> void:
	var temp_tower = tower.instantiate()
	var current_currency_amount =  GameManager.player_currency
	
	#detects when a user clicks
	if event is InputEventMouseButton and event.button_mask == 1:
		#when you add temp_tower as a child, you can no longer reference it
		#as "temp_tower", you now need to reference it as a child.
		
		#check if you have enough money to buy this tower
		if current_currency_amount >= tower_price:
			add_child(temp_tower)
			#TODO: what is this variable?
			temp_tower.process_mode = Node.PROCESS_MODE_DISABLED
			temp_tower.scale = Vector2(.32, .32)
		else:
			pass
	
	#mouse click & drag
	elif event is InputEventMouseMotion and event.button_mask == 1:
		if get_child(1) == null:
			pass
		else:
			#this will create the tower and make the tower follow the mouse
			#the grid placement now makes the towers snap into place
			get_child(1).global_position =  Vector2(
				floor(event.global_position.x / grid_size) * grid_size,
				floor(event.global_position.y / grid_size) * grid_size
			)
		
	#detects when a user releases the click
	elif event is InputEventMouseButton and event.button_mask == 0:
		if get_child(1) == null:
			pass
		else:
			get_child(1).queue_free()
			#"Main/Towers" references the Node2D in the main scene
			var path = get_tree().get_root().get_node("Main/Towers")
			path.add_child(temp_tower)
			temp_tower.global_position = Vector2(
				floor(event.global_position.x / grid_size) * grid_size,
				floor(event.global_position.y / grid_size) * grid_size
			)
			temp_tower.get_node("Placement Area").hide()
			GameManager.player_currency = current_currency_amount - tower_price
	else:
		if get_child_count() > 1:
			get_child(1).queue_free()
	
func _input(event):
	# Your code to execute when Escape is pressed
	if event.is_action_pressed("ui_cancel"):
		if get_child(1) == null:
			pass
		#if the user is trying to buy a tower
		else:
			self.get_child(1).queue_free()
