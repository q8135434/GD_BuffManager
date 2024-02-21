extends Node
class_name BuffData

enum BuffTimeUpdateEnum {
	Add,
	Replace,
	Keep,
}

enum BuffRemoveStackUpdateEnum {
	Clear,
	Reduce,
}

#基础信息
var buff_name  : String
var description: String
var icon       : Sprite2D
var max_stack  : int #最大层数
var priority   : int #优先级
var buff_type  : String #debuff  buff
var tags       :String #buff类型 该属性 加减血蓝 特殊定身...

#时间信息
var is_forever : bool #是否永存
var duration   : int  #持续回合

#更新方式
var buff_update_time			: BuffTimeUpdateEnum 
var buff_remove_stack_update	: BuffRemoveStackUpdateEnum

#回调点

#基础回调点
var on_create : BaseBuffModule
var on_remove : BaseBuffModule

#回血回蓝 回调点
var on_start : BaseBuffModule

func _init(data:Dictionary,_duration :int ,_property_value):

	priority			= data["priority"]
	is_forever			= data["is_forever"] 
	duration			= _duration
	buff_type			= data["buff_type"]
	tags				= data["tags"]
	
	buff_remove_stack_update = data["buff_remove_stack_update"]
	
	#这里要做buff分类了
	match tags:
		"ChangeAttribute":
			change_attribute(data["property_name"],_property_value)
		"ChangeHealth":
			change_health(_property_value)
		"ChangeMana":
			change_mana(_property_value)

#增减属性
func change_attribute(_property_name,_property_value) -> void :
	on_create = load("res://addons/gd_buffmanager/Buff/AttributeChange.gd").new({"property_name":_property_name,"property_value":_property_value})
	on_remove = load("res://addons/gd_buffmanager/Buff/AttributeChange.gd").new({"property_name":_property_name,"property_value":_property_value * -1 })
	pass

#恢复、扣除生命
func change_health(_property_value) -> void :
	on_create = load("res://addons/gd_buffmanager/Buff/HealthChange.gd").new({"property_name":null,"property_value":_property_value})
	on_start  = load("res://addons/gd_buffmanager/Buff/HealthChange.gd").new({"property_name":null,"property_value":_property_value})
	pass

#魔法值回复/消耗
func change_mana(_property_value) -> void :
	on_create = load("res://addons/gd_buffmanager/Buff/ManaChange.gd").new({"property_name":null,"property_value":_property_value})
	on_start  = load("res://addons/gd_buffmanager/Buff/ManaChange.gd").new({"property_name":null,"property_value":_property_value})
	pass
