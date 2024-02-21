extends BaseBuffModule

## buff 修改属性的 都在这里处理
func apply(buff_info : BuffInfo):
	if typeof(property_value) == TYPE_INT:
		change_int_cur_health(buff_info)
	elif typeof(property_value) == TYPE_FLOAT:
		change_rate_cur_health(buff_info)
	else :
		pass

func change_int_cur_health(buff_info : BuffInfo) -> void:
	buff_info.target.cur_health += property_value
	pass
	

func change_rate_cur_health(buff_info : BuffInfo) -> void:
	var target_property = buff_info.target.cur_health
	target_property = (1 + property_value) * buff_info.target.max_health
	pass
