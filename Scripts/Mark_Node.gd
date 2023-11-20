extends Panel

signal deletion_happened(mark_value: int)



func setup(new_mark: int, new_change_to_average: float):
	
	%Mark.text = str(new_mark)
	change_to_average_set_text(new_change_to_average)
	$AnimationPlayer.play("Appear")



func delete():
	
	deletion_happened.emit(int(%Mark.text))
	$AnimationPlayer.play("Disappear")



########## SUBFUNCTIONS ##########



func change_to_average_set_text(new_change_to_average: float):
	
	var new_color: String
	var new_text: String
	
	if new_change_to_average > 0:
		new_color = Globals.good_mark_color
		new_text = '+' + str(new_change_to_average)
	elif new_change_to_average < 0:
		new_color = Globals.bad_mark_color
		new_text = str(new_change_to_average)
	else:
		new_color = Globals.neutral_mark_color
		new_text = '-'
	
	%Change_To_Average.add_theme_color_override("font_color", new_color)
	%Change_To_Average.text = new_text
