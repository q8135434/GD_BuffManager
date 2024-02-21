@tool
extends EditorPlugin


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	add_custom_type("BaseBuffModule", "Object", preload("res://addons/gd_buffmanager/Buff/BaseBuffModule.gd"), EditorInterface.get_base_control().get_theme_icon("Object", "EditorIcons"))
	add_custom_type("BuffData", "Node", preload("res://addons/gd_buffmanager/Buff/BuffData.gd"), EditorInterface.get_base_control().get_theme_icon("Node", "EditorIcons"))
	add_custom_type("BuffHandler", "Object", preload("res://addons/gd_buffmanager/Buff/BuffHandler.gd"), EditorInterface.get_base_control().get_theme_icon("Object", "EditorIcons"))
	add_custom_type("BuffInfo", "Node", preload("res://addons/gd_buffmanager/Buff/BuffInfo.gd"), EditorInterface.get_base_control().get_theme_icon("Node", "EditorIcons"))
	pass


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	remove_custom_type("BaseBuffModule")
	remove_custom_type("BuffData")
	remove_custom_type("BuffHandler")
	remove_custom_type("BuffInfo")
	pass
