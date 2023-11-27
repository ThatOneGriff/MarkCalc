extends Label

var amount: int = 1:
	set = set_amount_text



func _ready():
	
	$AnimationPlayer.play("Appear")
	localize_text() # because when unmerged it was always Bri'ish



func delete():
	
	$AnimationPlayer.play("Disappear")



func merge_with(other_deleted_mark):
	
	amount = amount + other_deleted_mark.amount
	other_deleted_mark.delete()



########## SUBFUNCTIONS ##########



func localize_text():
	
	text = "= " + str(amount)
	
	if Localizations.current_language.get("Tag") == "en_EN":
		if amount == 1:
			text += " mark deleted ="
		else:
			text += " marks deleted ="
	
	elif Localizations.current_language.get("Tag") == "ru_RU":
		if (amount % 100 >= 11 and amount % 100 <= 19) or (amount % 10 >= 5 or amount % 10 == 0):
			text += " оценок удалено ="
		elif amount % 10 == 1:
			text += " оценка удалена ="
		elif amount % 10 <= 4:
			text += " оценки удалено ="



func set_amount_text(new_value: int):
	
	amount = new_value
	localize_text()
