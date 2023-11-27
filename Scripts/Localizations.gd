extends Node

const language_list: Array = [en_EN, ru_RU]
var current_language: Dictionary = language_list[current_language_id]
var current_language_id: int = 0:
	set = set_language



const en_EN: Dictionary = {"Tag": "en_EN",
						"Flag_Path": "res://UI/Images/Flags/GB.png", # 'GB' is .png and 'Russia' is .svg because Godot didn't display bri'ish .svg flag correctly.
						"New_Old_Pointer_Anchor_Offsets": Vector4(0, -327, 655, -278),
						"New_Old_Pointer_Rotation_Degrees": 90,
						
						"Average_Mark": "Average mark: ",
						"New_Old_Pointer": "<- new | old ->",
						
						"Save": "Save",
						"Open": "Open",
						"Cancel": "Cancel"}

const ru_RU: Dictionary = {"Tag": "ru_RU",
						"Flag_Path": "res://UI/Images/Flags/Russia.svg",
						"New_Old_Pointer_Anchor_Offsets": Vector4(-49, 328, 606, 377),
						"New_Old_Pointer_Rotation_Degrees": 270,
						
						"Average_Mark": "Средний балл: ",
						"New_Old_Pointer": "<- старые | новые ->",
						
						"Save": "Сохранить",
						"Open": "Открыть",
						"Cancel": "Отмена"} # order is different from English version because the sign is flipped



############ FUNCTIONS ###########



func get_localized_deleted_mark_text(amount: int) -> String:
	
	var text: String = "= " + str(amount)
	
	if current_language.get("Tag") == "en_EN":
		if amount == 1:
			text += " mark deleted ="
		else:
			text += " marks deleted ="
	
	elif current_language.get("Tag") == "ru_RU":
		if (amount % 100 >= 11 and amount % 100 <= 19) or (amount % 10 >= 5 or amount % 10 == 0):
			text += " оценок удалено ="
		elif amount % 10 == 1:
			text += " оценка удалена ="
		elif amount % 10 <= 4:
			text += " оценки удалено ="
	
	return text



########## SUBFUNCTIONS ##########



func set_language(new_value: int):
	
	if new_value > language_list.size() - 1: # language is being changed by ++-ing 'current_language_id'. Therefore, we need to make it circling.
		new_value = 0
	
	current_language_id = new_value
	current_language = language_list[current_language_id]
