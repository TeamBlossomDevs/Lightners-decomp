extends RefCounted
class __WVv_ extends __rtIV:
	var __oH2yS:Array[Parameter]
	var __1JjVo:__DnFs
	func _to_string()->String:return "func "+str(__nbLqJ)
	func get_children()->Array:return __oH2yS+__1JjVo.__jAWw
class __hiVS extends __rtIV:
	var __oH2yS:Array[Parameter]
	func _to_string()->String:return "signal "+str(__nbLqJ)
	func get_children()->Array:return __oH2yS
class __S0Vc extends __dSe_:
	var target:__YAHe.__yQyK
	var __0wq0:String
	var __UXvX:__Z7VQ
	func _to_string()->String:return "assign "+str(target)+" "+__0wq0
	func get_children()->Array[__dSe_]:return[__UXvX]
class __kNtn extends __dSe_:
	var condition:__Z7VQ
	var __1JjVo:__DnFs
	func _to_string()->String:return "if"
	func get_children()->Array[__dSe_]:return __1JjVo.__jAWw
class __l7ga extends __dSe_:
	var __1JjVo:__DnFs
	func _to_string()->String:return "else"
	func get_children()->Array[__dSe_]:return __1JjVo.__jAWw
class __KTY7 extends __dSe_:
	var __et0v0:__1DOi
	var __UXvX:__Z7VQ
	var __1JjVo:__DnFs
	func _to_string()->String:return "for"
	func get_children()->Array[__dSe_]:return([__et0v0]as Array[__dSe_])+__1JjVo.__jAWw
class __EgWu extends __dSe_:
	var condition:__Z7VQ
	var __1JjVo:__DnFs
	func _to_string()->String:return "elif"
	func get_children()->Array[__dSe_]:return __1JjVo.__jAWw
class __rtIV extends __dSe_:
	var __nbLqJ:__YAHe.__OrFi
	func _to_string()->String:return "declare symbol "+str(__nbLqJ)
class __SyVj extends __dSe_:
	var __1JjVo:__DnFs
	func _to_string()->String:return "match"
	func get_children()->Array[__dSe_]:return __1JjVo.__jAWw
const __Hk3U:=preload("../tokenizer/token.gd")
class __ckzp extends __1DOi:
	func _to_string()->String:return "@export var "+str(__nbLqJ)
class __DnFs extends __dSe_:
	var __wGTG:__Hk3U
	var __MdLL:__Hk3U
	var __jAWw:Array[__dSe_]
	func _to_string()->String:return "sequence"
	func get_children()->Array[__dSe_]:return __jAWw
class __3db1 extends __rtIV:
	var keys:Array[__5Ab3]
	func _to_string()->String:return "enum "+str(__nbLqJ)
	func get_children()->Array:return keys
	class __5Ab3 extends __rtIV:
		var __UXvX:__Z7VQ
		func _to_string()->String:return "key "+str(__nbLqJ)
class __dSe_:
	var parent:WeakRef
	var __vzp5n:__Hk3U
	var children:Array[__dSe_]
	func _init(__A7jR:__dSe_)->void:parent=weakref(__A7jR)
	func _to_string()->String:return "pass" if parent else "root"
	func get_parent()->__dSe_:return parent.get_ref()as __dSe_ if parent else null
	func get_children()->Array[__dSe_]:return children
	func print_tree(__6gJ1:int=0,__XV2D:String=">   ")->String:
		var __zpje:String="\n"+(__XV2D.repeat(__6gJ1)if __6gJ1>0 else "")+str(self)
		for __xWJW in get_children():
			__zpje+=__xWJW.print_tree(__6gJ1+1)
		return __zpje
class __LMEE extends __1DOi:
	func _to_string()->String:return "iterator "+str(__nbLqJ)
class __1DOi extends __rtIV:
	var __RK9i:String
	func _to_string()->String:return "var "+str(__nbLqJ)
class __OrFi extends __dSe_:
	var path:__YAHe.__yQyK
	func _to_string()->String:return "symbol "+str(path)
class Parameter extends __1DOi:
	func _to_string()->String:return "param "+str(__nbLqJ)
class __wnak extends __1DOi:
	func _to_string()->String:return "const "+str(__nbLqJ)
class __oqEl extends __rtIV:
	var __V32mr:__YAHe.__yQyK
	var __1JjVo:__DnFs
	func _to_string()->String:return "class "+str(__nbLqJ)+" extends "+str(__V32mr)
	func get_children()->Array[__dSe_]:return __1JjVo.__jAWw
class __grJF extends __dSe_:
	var condition:__Z7VQ
	var __1JjVo:__DnFs
	func _to_string()->String:return "while"
	func get_children()->Array[__dSe_]:return __1JjVo.__jAWw
class __sDwr extends __OrFi:
	var __19CPQ:Array[__Z7VQ]
	func _to_string()->String:return "call "+str(path)
	func get_children()->Array:return __19CPQ
class __Z7VQ extends __dSe_:
	var __UXvX:String
	var __TfBX:Array[__YAHe.__yQyK]
	func _to_string()->String:return __UXvX+" "+str(__TfBX)
const __YAHe:=preload("../../symbol_table.gd")
