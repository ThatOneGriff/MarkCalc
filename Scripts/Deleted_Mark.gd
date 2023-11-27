extends Label

var amount: int = 1:
	set = set_amount_text



func _ready():
	
	$AnimationPlayer.play("Appear")
	text = Localizations.get_localized_deleted_mark_text(amount) # because when unmerged it was always Bri'ish



func delete():
	
	$AnimationPlayer.play("Disappear")



func merge_with(other_deleted_mark):
	
	amount = amount + other_deleted_mark.amount
	other_deleted_mark.delete()



func set_amount_text(new_value: int):
	
	amount = new_value
	text = Localizations.get_localized_deleted_mark_text(amount)
