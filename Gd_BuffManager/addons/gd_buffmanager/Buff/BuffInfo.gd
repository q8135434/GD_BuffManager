extends Node
class_name BuffInfo

var buff_data : BuffData
var creater   
var target    

var duration_time : int      #剩余回合
var cur_stack     : int  = 1 ##当前层数

func _init(_creater,_target,_buff_data:BuffData):
	creater			= _creater
	target			= _target
	buff_data		= _buff_data
