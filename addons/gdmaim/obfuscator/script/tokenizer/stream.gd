extends RefCounted
func get_next()->String:
	__vHTD+=1
	if _data[__vHTD]=="\n":
		___nHT+=1
		__ioZ1=0
	else:
		__ioZ1+=1
	return _data[__vHTD]if __vHTD<_data.length()else ""
func _init(__PaCC:String)->void:
	_data=__PaCC
func __BJ4Z()->int:
	return __ioZ1
func __N6eo()->String:
	return "line: "+str(___nHT)+", column: "+str(__ioZ1)+")"
var __ioZ1:int=0
func __D58O()->int:
	return ___nHT
func __CgnK(__MQxL:int=1)->String:
	return _data[__vHTD+__MQxL]if __vHTD+__MQxL<_data.length()else ""
func __itUF()->bool:
	return __vHTD+1>=_data.length()
var __vHTD:int=-1
var ___nHT:int=1
var _data:String
