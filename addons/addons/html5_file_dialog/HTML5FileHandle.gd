extends RefCounted
class_name __T0zE
func __0b3t(__f2WL):
	if __Zk09:
		__YMX0=__f2WL[0]
	__aR1_.emit(__f2WL[0])
var __qTdR:JavaScriptObject
@export var path:String
var __324N:PackedByteArray
@export var name:String
signal __9wSk(__taFx:PackedByteArray)
@export var __Zk09:bool=true
func as_text()->String:
	if __Zk09 and __YMX0!='':
		return __YMX0
	if __J3mu==null:
		__J3mu=JavaScriptBridge.create_callback(__0b3t)
	__qTdR.text().then(__J3mu)
	return await __aR1_
func __ycE5(__V2XF):
	var __b3R3:PackedByteArray
	var __Gsws="HTML5FileHandle_"+str(get_instance_id()).replace('-','_')+'_buffer'
	var __VTFk=JavaScriptBridge.get_interface("window")
	__VTFk[__Gsws]=__V2XF[0]
	__b3R3=JavaScriptBridge.eval("window."+__Gsws)
	__VTFk[__Gsws]=null
	if __Zk09:
		__324N=__b3R3
	__9wSk.emit(__b3R3)
func __uLZi()->PackedByteArray:
	if not __324N.is_empty():
		return __324N
	if __6nhr==null:
		__6nhr=JavaScriptBridge.create_callback(__ycE5)
	__qTdR.arrayBuffer().then(__6nhr)
	return await __9wSk
signal __aR1_(__YWKb:String)
var __YMX0:String
func _init(__bg3B:JavaScriptObject):
	assert(OS.get_name()=='Web',"HTML5FileHandles can only be used in a web export, and should only be created by a HTML5FileDialog node.")
	__qTdR=__bg3B
	name=__qTdR.name
	__b74H=__qTdR.lastModified
	path=__qTdR.webkitRelativePath
var __J3mu:JavaScriptObject
@export var __b74H:float
var __6nhr:JavaScriptObject
