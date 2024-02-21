extends Object
class_name BuffHandler

var buff_list : Array[BuffInfo]

func add_buff(buff_info : BuffInfo) -> void:
	buff_info.duration_time = buff_info.buff_data.duration
	buff_info.buff_data.on_create.apply(buff_info)
	buff_list.append(buff_info)
	##排序buff_list
	buff_list.sort_custom(func(a, b): return a.buff_data.priority > b.buff_data.priority)

func remove_buff(buff_info : BuffInfo) -> void:
	match buff_info.buff_data.buff_remove_stack_update:
		0:
			buff_info.buff_data.on_remove.apply(buff_info)
			buff_list.erase(buff_info)
			pass
		1:
			#层数自减
			buff_info.cur_stack -= 1
			buff_info.buff_data.on_remove.apply(buff_info)
			if buff_info.cur_stack <= 0:
				buff_list.erase(buff_info)
			else :
				#更新他剩余回合时间
				buff_info.duration_time = buff_info.buff_data.duration
			pass

func update_buff() -> void:
	var delete_buff :Array[BuffInfo] 
	for buff in buff_list:
		buff.duration_time -= 1
		if buff.duration_time <= 0 :
			delete_buff.append(buff)
	##删除buff
	for buff in delete_buff:
		remove_buff(buff)
