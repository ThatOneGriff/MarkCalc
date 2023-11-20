extends CanvasLayer

var average: float = 0
var mark_amount: float = 0
var mark_sum: float = 0

var change_to_average: float



func set_average_text():
	
	var new_text: String = "Average: "
	
	if (average == 0):
		new_text += "-"
	else:
		new_text += str(Globals.round_to_decimal_place(average, 2))
	
	$Average/Label.text = new_text



########## SIGNALS ##########



func _on_all_marks_on_screen_mark_node_deleted(mark_value: int):
	
	mark_amount -= 1
	
	if mark_amount == 0: # no marks left
		average = 0
		mark_sum = 0
	
	else:
		mark_sum -= mark_value
		average = mark_sum / mark_amount
	
	set_average_text()



func _on_delete_all_pressed():
	
	for curr_mark in $All_Marks_On_Screen/MarginContainer/Nodes.get_children():
		
		if ! (curr_mark is Panel):
			continue
		
		curr_mark.delete()



func _on_keyboard_pressed(mark_value: int):
	
	mark_amount += 1
	mark_sum += mark_value
	
	if (average == 0): # no marks yet
		change_to_average = 0
	else:
		change_to_average = mark_sum / mark_amount - average
		change_to_average = Globals.round_to_decimal_place(change_to_average, 2)
	
	$All_Marks_On_Screen.add_new_mark(mark_value, change_to_average)
	average = mark_sum / mark_amount
	
	set_average_text()
