extends Node

var bad_mark_color: String = "fd5e53"
var good_mark_color: String = "21bf73"
var neutral_mark_color: String = "272829"



func round_to_decimal_place(number: float, decimal_place: int) -> float:
	
	return round(number * pow(10, decimal_place)) / pow(10, decimal_place)
