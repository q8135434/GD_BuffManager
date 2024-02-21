extends BaseBuffModule

## buff 修改魔法值的 都在这里处理
func apply(buff_info : BuffInfo):
	if typeof(property_value) == TYPE_INT:
		change_int_cur_mana(buff_info)
	elif typeof(property_value) == TYPE_FLOAT:
		change_rate_cur_mana(buff_info)
	else :
		pass

func change_int_cur_mana(buff_info : BuffInfo) -> int:
	buff_info.target.cur_mana = property_value
	return int(property_value)
	

func change_rate_cur_mana(buff_info : BuffInfo) -> int:
	var cur_mana = buff_info.target.cur_mana
	var change   = buff_info.target.max_mana * property_value
	cur_mana     = change
	return int(change)
