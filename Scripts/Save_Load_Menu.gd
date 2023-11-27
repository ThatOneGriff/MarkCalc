extends Panel

signal cancel



####### SIGNALS #######



func _on_cancel_pressed():
	
	cancel.emit()


func _on_language_reset():
	
	%Save.text = Localizations.current_language.get("Save")
	%Open.text = Localizations.current_language.get("Open")
	%Cancel.text = Localizations.current_language.get("Cancel")
	
	if Localizations.current_language.get("Tag") == "ru_RU":
		%Save.add_theme_font_size_override("font_size", 86)
