extends Label

var amount: int = 1:
	set = set_amount_text



func merge_with(other_deleted_mark):
	
	amount = amount + other_deleted_mark.amount
	other_deleted_mark.queue_free()



########## SUBFUNCTIONS ##########



func set_amount_text(new_value: int):
	
	amount = new_value
	text = "= " + str(amount) + " mark(s) deleted ="
