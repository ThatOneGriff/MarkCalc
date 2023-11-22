extends Node

const language_list: Array = [EN, RU]
var current_language: Dictionary = language_list[current_language_id]
var current_language_id: int = 0:
	set = set_language


const EN: Dictionary = {"Flag_Path": "res://UI/Images/Flags/GB.png",
						"Average_Mark": "Average mark: ",
						"New_Old_Pointer": "<- new | old ->"}

const RU: Dictionary = {"Flag_Path": "res://UI/Images/Flags/Russia.svg",
						"Average_Mark": "Средний балл: ",
						"New_Old_Pointer": "<- новые | старые ->"}



########## SUBFUNCTIONS ##########

func set_language(new_value: int):
	
	if new_value > language_list.size() - 1: # language is being changed by ++-ing current_language_id. Therefore, we need to circle through it.
		new_value = 0
	
	current_language_id = new_value
	current_language = language_list[current_language_id]
