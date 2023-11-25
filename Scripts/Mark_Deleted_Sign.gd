extends Label

var amount: int:
	set = set_amount_text



########## SUBFUNCTIONS ##########



func set_amount_text(new_value: int):
	
	amount = new_value
	text = "= " + str(amount) + " mark(s) deleted ="
