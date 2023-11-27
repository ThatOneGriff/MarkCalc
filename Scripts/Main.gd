extends CanvasLayer

var average: float = 0:
	set = set_average_text # setting 'average' also automatically sets its text
var mark_amount: float = 0
var mark_sum: float = 0

var change_to_average: float



# TODO: write it properly, so it sets stuff automatically no matter how many languages the app has.
func _ready():
	
	if OS.get_locale() == "ru_RU":
		%Language_Changer.change_language(0) # for example, this function could take more arguments, such as 'change_to': String



func reset_mark_values():
	
	average = 0
	mark_amount = 0
	mark_sum = 0



########## SUBFUNCTIONS ##########



func set_average_text(new_value: float = average):
	
	average = new_value
	var new_text: String = Localizations.current_language.get("Average_Mark")
	
	if (average == 0):
		new_text += "-"
	else:
		new_text += str(Globals.round_to_decimal_place(average, 2))
	
	$Average/Average_Mark.text = new_text



########## SIGNALS ##########



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



func _on_list_of_marks_mark_node_deleted(mark_value: int):
	
	mark_amount -= 1
	
	if mark_amount == 0: # no marks left
		reset_mark_values()
	
	else:
		mark_sum -= mark_value
		average = mark_sum / mark_amount
