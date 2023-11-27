extends Button



func _ready():
	
	connect("button_up", on_unpressed)



####### SIGNALS #######



func on_unpressed():
	
	focus_mode = Control.FOCUS_NONE
