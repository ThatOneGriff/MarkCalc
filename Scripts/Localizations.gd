extends Node

const language_list: Array = [EN, RU]
var current_language: Dictionary = language_list[current_language_id]
var current_language_id: int = 0:
	set = set_language


const EN: Dictionary = {"Flag_Path": "res://UI/Images/Flags/GB.png", # GB is .png and Russia is .svg because Godot didn't display bri'ish .svg flag correctly.
						"New_Old_Pointer_Anchor_Offsets": Vector4(0, -327, 655, -278),
						"New_Old_Pointer_Rotation_Degrees": 90,
						
						"Average_Mark": "Average mark: ",
						"New_Old_Pointer": "<- new | old ->"}

const RU: Dictionary = {"Flag_Path": "res://UI/Images/Flags/Russia.svg",
						"New_Old_Pointer_Anchor_Offsets": Vector4(-49, 328, 606, 377),
						"New_Old_Pointer_Rotation_Degrees": 270,
						
						"Average_Mark": "Средний балл: ",
						"New_Old_Pointer": "<- старые | новые ->"} # order is different from English version because the sign is flipped



########## SUBFUNCTIONS ##########

func set_language(new_value: int):
	
	if new_value > language_list.size() - 1: # language is being changed by ++-ing current_language_id. Therefore, we need to circle through it.
		new_value = 0
	
	current_language_id = new_value
	current_language = language_list[current_language_id]
