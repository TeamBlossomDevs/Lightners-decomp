@tool
extends RefCounted
static func __Zpnz(__Nbya:Variant)->String:
	return __XE4M[__Nbya].trim_suffix("\n")
static var __CwAM:Variant
static func clear()->void:
	__XE4M[__CwAM]=""
static func clear_all()->void:
	__XE4M.clear()
static func __d8Hd(__uIH9:Variant)->void:
	__CwAM=__uIH9
	__XE4M[__uIH9]=__XE4M.get(__uIH9,"")
static func __Q1Nt()->String:
	return __XE4M[__CwAM].trim_suffix("\n")
static func __FY8X(__fsvq:String)->void:
	__XE4M[__CwAM]+=__fsvq+"\n"
static var __XE4M:Dictionary={}
