extends Object
class_name BaseBuffModule

var property_name :String
var property_value

func _init(_data:Dictionary):
	property_name  = _data["property_name"]
	property_value = _data["property_value"]

func apply(buff_info : BuffInfo):
	return
	
