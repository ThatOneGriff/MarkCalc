extends Button



func _on_pressed():
	
	%AnimationPlayer.play("Darken_Screen")



func _on_unpressed():
	
	focus_mode = Control.FOCUS_NONE
