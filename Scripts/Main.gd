extends CanvasLayer

var average: float = 0:
	set = set_average_text # setting average also automatically sets its text
var mark_amount: float = 0
var mark_sum: float = 0

var change_to_average: float




########## SUBFUNCTIONS ##########



func set_average_text(new_value: float = average):
	
	average = new_value
	var new_text: String = Localizations.current_language.get("Average_Mark")
	
	if (average == 0):
		new_text += "-"
	else:
		new_text += str(Globals.round_to_decimal_place(average, 2))
	
	$Average/Label.text = new_text



########## SIGNALS ##########



func _on_list_of_marks_mark_node_deleted(mark_value: int):
	
	mark_amount -= 1
	
	if mark_amount == 0: # no marks left
		average = 0
		mark_sum = 0
	
	else:
		mark_sum -= mark_value
		average = mark_sum / mark_amount



func _on_keyboard_pressed(mark_value: int):
	
	mark_amount += 1
	mark_sum += mark_value
	
	if (average == 0): # no marks yet
		change_to_average = 0
	else:
		change_to_average = mark_sum / mark_amount - average
		change_to_average = Globals.round_to_decimal_place(change_to_average, 2)
	
	%List_Of_Marks.add_new_mark(mark_value, change_to_average)
	average = mark_sum / mark_amount



func _on_language_reset():
	
	set_average_text()
