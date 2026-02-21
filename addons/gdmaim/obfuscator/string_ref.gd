extends RefCounted
var __YFDH:WeakRef
func set_value(__54mV:String)->void:
	__e67o=__54mV
const __SqVX:=preload("string_ref.gd")
func __2FnPv(__asQ4:__SqVX)->void:
	__YFDH=weakref(__asQ4)
func get_value()->String:
	return str(self)
func _init(__ycOP:String="")->void:
	__e67o=__ycOP
var __e67o:String
func _to_string()->String:
	return __e67o if!__YFDH else __YFDH.get_ref()._to_string()
