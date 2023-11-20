extends Button
class_name Keyboard_Button

signal keyboard_pressed(mark_value: int)

var mark: int





func _ready():
	
	mark = int(text)
	
	connect("button_up", on_unpressed)
	connect("pressed", on_pressed)



########## SIGNALS ##########



func on_pressed():
	
	keyboard_pressed.emit(mark)



func on_unpressed():
	
	focus_mode = Control.FOCUS_NONE
