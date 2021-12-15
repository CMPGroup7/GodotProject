extends MenuButton

var popup
onready var player_vars = get_node("/root/GlobalVariables")

# set mute and unmute button while playing the game
func _ready():
	popup = get_popup()
	popup.add_item("Mute")
	popup.connect("id_pressed", self, "_on_item_pressed")
	popup = get_popup()
	popup.add_item("Unmute")
	popup.connect("id_pressed", self, "_on_item_pressed")

# set mute or unmute when press the button
func _on_item_pressed(ID):
	
	if ID == 0:
			AudioServer.set_bus_mute(player_vars.master_sound, true)

	if ID == 1:
			AudioServer.set_bus_mute(player_vars.master_sound, false)

		
	print(popup.get_item_text(ID), " pressed")
