extends MenuButton

var popup
onready var player_vars = get_node("/root/GlobalVariables")

func _ready():
	popup = get_popup()
	popup.add_item("Mute")
	popup.connect("id_pressed", self, "_on_item_pressed")

func _on_item_pressed(ID):
	
	if ID == 0:
		AudioServer.set_bus_mute(player_vars.master_sound, true)
		
	print(popup.get_item_text(ID), " pressed")
