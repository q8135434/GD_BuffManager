extends BaseBuffModule

## buff 修改属性的 都在这里处理
func apply(buff_info : BuffInfo):
	if typeof(property_value) == TYPE_INT:
		change_int_property(buff_info)
	elif typeof(property_value) == TYPE_FLOAT:
		change_rate_propoty(buff_info)
	else :
		pass

func change_int_property(buff_info : BuffInfo) -> void:
	buff_info.target.attribute.buff_attr[property_name] += property_value
	pass
	

func change_rate_propoty(buff_info : BuffInfo) -> void:
	var target_property = buff_info.target.attribute.buff_attr[property_name]
	target_property[property_name] = (1 + property_value) * target_property[property_name]
	pass
	
	
