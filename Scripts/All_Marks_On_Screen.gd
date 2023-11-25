extends ScrollContainer

signal mark_node_deleted(mark_value: int)

var mark_node: PackedScene = preload("res://Scenes/Mark_Node.tscn")
var tween: Tween



func add_new_mark(mark_value: int, new_change_to_average: float):
	
	var new_mark_node = mark_node.instantiate() as Panel
	
	new_mark_node.setup(mark_value, new_change_to_average)
	new_mark_node.connect("deletion_happened", mark_node_deletion_happened)
	
	%Nodes.add_child(new_mark_node)
	%Nodes.move_child(new_mark_node, 1)



########## SIGNALS ##########



func mark_node_deletion_happened(mark_value: int):
	
	mark_node_deleted.emit(mark_value)
