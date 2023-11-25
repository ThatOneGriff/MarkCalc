extends Label

var amount: int:
	set = set_amount_text



func _ready():
	
	$AnimationPlayer.play("Appear")



func setup(new_amount: int):
	
	amount = new_amount



########## SUBFUNCTIONS ##########



func set_amount_text(new_value: int):
	
	amount = new_value
	text = "= " + str(amount) + " mark(s) deleted ="
