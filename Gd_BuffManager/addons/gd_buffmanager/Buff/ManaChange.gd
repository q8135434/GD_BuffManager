extends BaseBuffModule

## buff 修改魔法值的 都在这里处理
func apply(buff_info : BuffInfo):
	if typeof(property_value) == TYPE_INT:
		change_int_cur_mana(buff_info)
	elif typeof(property_value) == TYPE_FLOAT:
		change_rate_cur_mana(buff_info)
	else :
		pass

func change_int_cur_mana(buff_info : BuffInfo) -> void:
	buff_info.target.cur_mana += property_value
	pass
	

func change_rate_cur_mana(buff_info : BuffInfo) -> void:
	var cur_mana = buff_info.target.cur_mana
	cur_mana = (1 + property_value) * buff_info.target.max_mana
	pass
