extends RefCounted
var __nAvs:Dictionary
var __f5xn:Array[__OrFi]
func __vU5d()->void:
	for __KiSH in __05aG:
		var __yck7:String="Line "+str(__KiSH.__SYI0i+1)+" | "+str(__KiSH)+" |"
		var __8epn:__OrFi
		var __PQXf:bool=__KiSH.__reiEz
		for __vQXW in __KiSH.__cXM6v:
			__yck7+=" ["+__vQXW.get_name()+"="
			if __8epn:
				__8epn=__8epn.children.get(__vQXW.get_name())
				__yck7+="CHILD" if __8epn else ""
			if!__8epn and __PQXf:
				__8epn=__G_RZ(__KiSH.__GMPJ(),__vQXW.get_name(),__KiSH.__e2MK and __KiSH.__cXM6v.back()==__vQXW)
				__yck7+="LOCAL" if __8epn else ""
			if!__8epn:
				__8epn=__80Rc(__vQXW.get_name())
				__yck7+="GLOBAL" if __8epn else ""
			if __8epn:
				__vQXW.__2FnPv(__8epn)
				if __8epn.type=="Dictionary":
					break
			else:
				__yck7+="?"
			__PQXf=false
			__yck7+="]"
		__V4Hf.__d8Hd(__KiSH.__Zpnz())
		__V4Hf.__FY8X(__yck7)
const __7Lti:=preload("../settings.gd")
var __1aaA:Dictionary
class __OrFi extends RefCounted:
	var name:__SqVX
	var __bjHA8:String
	var type:String
	var children:Dictionary
	var __iwVa8:Array
	var parent:__OrFi
	static func __91k1(__8iYf:String,__Q9qM:__OrFi)->__OrFi:
		var __J2nY:=__OrFi.new(__Q9qM.__bjHA8,__8iYf)
		__J2nY.__2FnPv(__Q9qM)
		return __J2nY
	func _init(__xpHr:String,__Ny4q:String="")->void:
		self.name=__SqVX.new(__xpHr)
		self.__bjHA8=__xpHr
		self.type=__Ny4q
	func _to_string()->String:
		return str(name)if!type else str(name)+":"+type
	func get_name()->String:
		return name.get_value()
	func __8OE0()->String:
		return __bjHA8
	func add_child(__KaU4:__OrFi)->void:
		children[__KaU4.name.get_value()]=__KaU4
	func __Tc6y(__vyc6:int)->void:
		if!__iwVa8.has(__vyc6):
			__iwVa8.append(__vyc6)
	func __5CT6()->bool:
		return!__iwVa8.is_empty()
	func __CS_I(__Tipj:int)->bool:
		return __iwVa8.has(__Tipj)
	func __2FnPv(__h73T:__OrFi)->void:
		name.__2FnPv(__h73T.name)
		parent=__h73T
		children.merge(__h73T.children)
		__h73T.children=children
		__iwVa8=__iwVa8+__h73T.__iwVa8
		__h73T.__iwVa8=__iwVa8
	func get_root()->__OrFi:
		return parent.get_root()if parent else self
var __aLN1:int
const __OzRr:=preload("script/parser/ast.gd")
func __a5EN(__3FGh:String,__Q6QZ:String="")->__OrFi:
	var __Gpma:__OrFi=__wh7Y(__3FGh,__Q6QZ)
	__nAvs[__3FGh]=__Gpma
	if!__5Uuzt.__jt6U:
		__kWZH(__3FGh)
	return __Gpma
func __ZFm_()->void:
	for __xuK2 in __f5xn:
		__PQSI(__xuK2,__uJJe(__xuK2.get_name(),true))
	for __6zb1 in __1aaA.values():
		if!__I2Zx.has(__6zb1.get_name()):
			__PQSI(__6zb1,__uJJe(__6zb1.get_name()))
func __srOQ(__5Bzp:String,__nNkh:String="")->__OrFi:
	var ___orW:=__OrFi.new(__5Bzp,__nNkh)
	__f5xn.append(___orW)
	return ___orW
func __PQSI(__wLVw:__OrFi,__nzaF:String)->void:
	__wLVw.name.set_value(__nzaF)
func __kWZH(__4gpQ:String)->void:
	__I2Zx[__4gpQ]=true
func __N0JH(__HcoZ:__OzRr.__dSe_)->__yQyK:
	var __HpnQ:=__yQyK.new()
	__HpnQ.__bbLJ(__HcoZ)
	__05aG.append(__HpnQ)
	return __HpnQ
func __Qbmi(__7sxW:String)->__OrFi:
	return __nAvs.get(__7sxW)
func _init(__mXKI:__7Lti)->void:
	self.__5Uuzt=__mXKI
	__aLN1=hash(str(__mXKI.__q0ET if!__mXKI.___adQ else int(Time.get_unix_time_from_system())))
var __5Uuzt:__7Lti
func __G_RZ(__DWYi:__OzRr.__dSe_,__nBP0:String,__IeS2:bool)->__OrFi:
	var __FEp1:__OzRr.__dSe_=__DWYi
	__DWYi=__DWYi.get_parent()
	while __DWYi:
		for __ZKAq in __DWYi.get_children():
			if __ZKAq==__FEp1:
				break
			elif __ZKAq is __OzRr.__rtIV and __ZKAq.__nbLqJ.get_name()==__nBP0 and(__ZKAq is __OzRr.__WVv_==__IeS2):
				return __ZKAq.__nbLqJ
		__DWYi=__DWYi.get_parent()
	return null
var __05aG:Array[__yQyK]
func __uJJe(__6pEQ:String,__6g3H:bool=false)->String:
	if!__6g3H and __rD7F.has(__6pEQ):
		return __rD7F[__6pEQ]
	var __Ife2:=RandomNumberGenerator.new()
	__Ife2.seed=hash(__6pEQ)+__6pEQ.length()+__aLN1
	var __cSKK:int=maxi(1,__5Uuzt.__u8ch)
	var __VICc:String
	while!__VICc or __Awzm.has(__VICc):
		var __l2ov:String=__5Uuzt.__BLO_
		for __XJ2W6D in __cSKK:
			__l2ov+=__5Uuzt.__ik3R[__Ife2.randi()%__5Uuzt.__ik3R.length()]
		if!__VICc and __6g3H and __Awzm.has(__l2ov):
			__TQmL[__6pEQ]=__TQmL.get(__6pEQ,0)+1
			__Ife2.seed+=__TQmL[__6pEQ]
		else:
			__cSKK+=1
		__VICc=__l2ov
	__Awzm.append(__VICc)
	if!__6g3H:
		__rD7F[__6pEQ]=__VICc
	return __VICc
var __rD7F:Dictionary
var __Awzm:PackedStringArray
class __yQyK:
	var __cQ2af:WeakRef
	var __cXM6v:Array[__OrFi]
	var __e2MK:bool=false
	var __reiEz:bool=true
	var log:WeakRef
	var __SYI0i:int
	func _to_string()->String:
		var __jpJA:String
		for __5JaR in __cXM6v:
			__jpJA+=str(__5JaR)+"."
		return __jpJA.trim_suffix(".")
	func __FuYx(__LmCf:String)->__OrFi:
		var __ist3:=__OrFi.new(__LmCf)
		__cXM6v.append(__ist3)
		return __ist3
	func __bbLJ(__mmI8:__OzRr.__dSe_)->void:
		self.__cQ2af=weakref(__mmI8)
	func __GMPJ()->__OzRr.__dSe_:
		return __cQ2af.get_ref()as __OzRr.__dSe_ if __cQ2af else null
	func __ULDG(__eZQw:Variant)->void:
		self.log=weakref(__eZQw)
	func __Zpnz()->Variant:
		return log.get_ref()if log else null
func __80Rc(__qL7G:String)->__OrFi:
	return __1aaA.get(__qL7G)
func __CSim(__tJ5_:__OrFi)->void:
	var __1Zdx:int=__f5xn.find(__tJ5_)
	if __1Zdx!=-1:
		__f5xn.remove_at(__1Zdx)
	else:
		__kWZH(__tJ5_.get_name())
const __SqVX:=preload("string_ref.gd")
func __wh7Y(__vMpX:String,__TMjz:String="")->__OrFi:
	var __7TaP:__OrFi=__1aaA.get(__vMpX)
	if!__7TaP:
		__7TaP=__OrFi.new(__vMpX)
		__1aaA[__vMpX]=__7TaP
	return __OrFi.__91k1(__TMjz,__7TaP)
const __V4Hf:=preload("../logger.gd")
func __nrZ7(__rEnu:String)->String:
	return __uJJe(__rEnu)if!__I2Zx.has(__rEnu)else __rEnu
var __I2Zx:Dictionary
func __cFnK(__SoRc:__OzRr.__dSe_,__vsKl:String,__Yrql:String="")->__OrFi:
	if __SoRc.get_parent()is __OzRr.__DnFs and __SoRc.get_parent().get_parent()is __OzRr.__oqEl:
		return __wh7Y(__vsKl,__Yrql)
	else:
		return __srOQ(__vsKl,__Yrql)
var __TQmL:Dictionary
