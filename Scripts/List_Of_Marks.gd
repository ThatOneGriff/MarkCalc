extends VBoxContainer

signal mark_node_deleted(mark_value: int)

var mark_node: PackedScene = preload("res://Scenes/Mark_Node.tscn")
var deleted_mark: PackedScene = preload("res://Scenes/Deleted_Mark.tscn")
var tween: Tween



func add_new_mark(mark_value: int, new_change_to_average: float):
	
	var new_mark_node = mark_node.instantiate() as Panel
	
	new_mark_node.setup(mark_value, new_change_to_average)
	new_mark_node.connect("deletion_happened", mark_node_deletion_happened)
	
	add_child(new_mark_node)
	move_child(new_mark_node, 1)



########## SIGNALS ##########



func mark_node_deletion_happened(mark_value: int, node):
	
	mark_node_deleted.emit(mark_value)
	instantiate_deleted_mark_sign(node)



func _on_delete_all_pressed():
	
	for curr in get_children():
		
		if ! (curr is Panel):
			continue
		curr.delete()



####### SUBFUNCTIONS #######



func instantiate_deleted_mark_sign(node):
	
	var node_index: int = -1
	var lower_deleted_mark = null
	var upper_deleted_mark = null
	
	for i in get_child_count():
		
		var curr = get_child(i)
		if curr == node:
			node_index = i
			break
	
	var new_deleted_mark = deleted_mark.instantiate() as Label
	
	if node_index - 1 > 0 and get_child(node_index - 1) is Label:
		upper_deleted_mark = get_child(node_index - 1)
		new_deleted_mark.merge_with(upper_deleted_mark)
	
	if node_index + 1 < get_child_count() and get_child(node_index + 1) is Label:
		lower_deleted_mark = get_child(node_index + 1)
		new_deleted_mark.merge_with(lower_deleted_mark)
	
	remove_child(get_child(node_index)) # remove_child to quickly replace it
	
	add_child(new_deleted_mark)
	move_child(new_deleted_mark, node_index)
	
	node.queue_free()
