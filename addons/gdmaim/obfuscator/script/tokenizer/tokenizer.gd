extends RefCounted
func __94Uf(__O0H5:int=__Hk3U.Type.__rtVp+__Hk3U.Type.__opIF+__Hk3U.Type.__y04f+__Hk3U.Type.__4sWf)->__Hk3U:
	var __NKyK:__Hk3U=__nJNx(__O0H5)
	if __NKyK:
		__hkt0(__NKyK)
	else:
		__vHTD=__Rv8p.size()-1
	return __NKyK
func __j8By(__2tYo:String)->void:
	__Tmk6(__Hk3U.Type.__N_w8,__2tYo)
func __vIWq(__5q9P:String)->void:
	__Tmk6(__Hk3U.Type.__opIF,__5q9P,false)
func __8WPv(__NKm9:int)->void:
	__Tmk6(__Hk3U.Type.__y04f,"\t".repeat(__NKm9))
const __9wO5:String="+-*^/%=<>!&|"
func __53e1()->void:
	__5NI5(__PUrc(__4ZjW))
func __RxKS()->void:
	var __oC0C:String=__7HcE("\n")
	if __oC0C.begins_with(__7Lti.current.__WERQ):
		var __uVRT:PackedStringArray=__oC0C.split(__7Lti.current.__WERQ)
		for __iP_o in __uVRT:
			var __ZWAl:PackedStringArray=__iP_o.split(" ",false,1)
			if __ZWAl:
				__EHK2.back().__VSMX(__ZWAl[0],__ZWAl[1]if __ZWAl.size()==2 else "")
	__vIWq(__oC0C)
func __bv6m()->Array[__WYjq]:
	return __EHK2
func __5NI5(__6p24:String)->void:
	__Tmk6(__Hk3U.Type.__rtVp,__6p24,false)
func __Iy2l(__b9v3:int,__mMbS:int)->void:
	__EHK2[__b9v3].__kD1N(__mMbS)
func __4ZjW(__8dmg:String)->bool:
	return __8dmg==" " or __8dmg=="\t"
const __gccm:=preload("stream.gd")
func __V5hC(__Ml63:String)->bool:
	return ".0123456789".contains(__Ml63)
const __V4Hf:=preload("../../../logger.gd")
func __cRLq()->void:
	__sZyy(__PUrc(__iKI5))
const __oPna:Array[String]=["true","false","null","self","PI","TAU","NAN","INF"]
func __T8IL(__qM4g:String)->void:
	__Tmk6(__Hk3U.Type.__ZQBT,__qM4g)
func __GI3l(__otgN:String)->bool:
	return __0nLl.has(__otgN)or __otgN.begins_with("@export")
func __mFTQ(__liB_:String)->void:
	__Tmk6(__Hk3U.Type.__hK0k,__liB_)
func __9F28()->Array[__Hk3U]:
	return __Rv8p
func __SVy3(__OpbR:String)->void:
	__Tmk6(__Hk3U.Type.__p3TB,__OpbR)
const __cKXr:String="()[]{},;:."
func __zTCw()->int:
	return __EHK2.size()
var __vHTD:int
func __t3fv(__gYhe:int)->__WYjq:
	return __EHK2[__gYhe]if __gYhe>=0 and __gYhe<__EHK2.size()else null
func __zTci()->void:
	var __CQoR:String
	var __QMFk:String=__HJIN.get_next()
	while!__HJIN.__itUF():
		var __u3w9:String=__HJIN.get_next()
		if __u3w9=="\\":
			__u3w9+=__HJIN.get_next()
		if __u3w9==__QMFk:
			break
		__CQoR+=__u3w9
	__SVy3(__QMFk+__CQoR+__QMFk)
func __iKI5(__tNxX:String)->bool:
	return __9wO5.contains(__tNxX)
func __wr59(__3MCR:String)->void:
	__Tmk6(__Hk3U.Type.__W_qr,__3MCR)
func __SyZi(__Cb4t:int)->void:
	__EHK2.remove_at(__Cb4t)
func __O_5N(__JKxr:String)->void:
	__Tmk6(__Hk3U.Type.__xTtR,__JKxr)
func __hkt0(__Bsvm:__Hk3U)->__Hk3U:
	__vHTD=__Bsvm.__e1u7c
	return __Bsvm
func __iO7k()->String:
	var __uQrW:String
	for __yzpt in __EHK2:
		for __COWC in __yzpt.__LHk_O:
			__uQrW+=__COWC.get_value()
	return __uQrW
func __Tmk6(__KEAk:__Hk3U.Type,__oKxb:String,__2nMy:bool=true)->void:
	var __W5ju:=__Hk3U.new(__KEAk,__oKxb,__Rv8p.size(),__EHK2.size()-1)
	__EHK2.back().__VIfy(__W5ju)
	if __2nMy:
		__Rv8p.append(__W5ju)
func __itUF(__39qt:int=0)->bool:
	return __vHTD+__39qt>=__Rv8p.size()-1
class __WYjq:
	var __LHk_O:Array[__Hk3U]
	var __OhxCu:Dictionary
	var __5wjmE:int
	func _init(__Epqm:Array[__Hk3U]=[])->void:
		self.__LHk_O=__Epqm
	func _to_string()->String:
		var __AlHe:String
		for __MSO8 in __LHk_O:
			__AlHe+=str(__MSO8)
		return __AlHe
	func __VIfy(__aKRZ:__Hk3U)->void:
		__LHk_O.append(__aKRZ)
	func __z44N(__85d7:int,__luXU:__Hk3U)->void:
		__LHk_O.insert(__85d7,__luXU)
	func __kD1N(__mouJ:int)->void:
		__LHk_O.remove_at(__mouJ)
	func __xqyz(__eESQ:__Hk3U)->void:
		__LHk_O.erase(__eESQ)
	func ___Se9(__osK0:bool=true)->void:
		for __HGDP in range(__LHk_O.size()-1,-1,-1):
			var __ZKot:__Hk3U=__LHk_O[__HGDP]
			if!__ZKot.__VyR8()and(!__osK0 or!__ZKot.__xf8e()):
				__LHk_O.remove_at(__HGDP)
	func __VSMX(__IDnz:String,__EYDE:String)->void:
		__OhxCu[__IDnz]=__EYDE
	func __A8ru(__aw6k:String)->bool:
		return __OhxCu.has(__aw6k)
	func __4lbX(__1UPw:String)->String:
		return __OhxCu.get(__1UPw,"")
	func __mrv7()->int:
		return 0 if!__LHk_O or __LHk_O[0].type!=__Hk3U.Type.__y04f else __LHk_O[0].get_value().length()
	func __RNqr()->bool:
		var __NJWCX:int=0 if __mrv7()==0 else 1
		return __LHk_O.size()>=__NJWCX+1 and!__LHk_O[__NJWCX].__CUkS()and!__LHk_O[__NJWCX].__VyR8()
	func __BUN2(__oXCD:String)->bool:
		for __nb3Y in __LHk_O:
			if __nb3Y.get_value()==__oXCD:
				return true
		return false
func read(__fb0b:String)->void:
	__f5GI=1
	__Rv8p.clear()
	__vHTD=-1
	___nHT=0
	__EHK2=[__WYjq.new()]
	__HJIN=__gccm.new(__fb0b)
	while __guJl():pass
func __86yt(__yanJ:String)->__Hk3U:
	while!__itUF():
		var __Dqoz:__Hk3U=get_next()
		if __Dqoz.get_value()==__yanJ:
			return __Dqoz
	return null
func __nJNx(__K9YF:int=__Hk3U.Type.__rtVp+__Hk3U.Type.__opIF+__Hk3U.Type.__y04f+__Hk3U.Type.__4sWf)->__Hk3U:
	for __y3Px in range(__vHTD+1,__Rv8p.size()):
		var __W4N0:__Hk3U=__Rv8p[__y3Px]
		if!(__W4N0.type&__K9YF):
			return __W4N0
	return null
var __Rv8p:Array[__Hk3U]
func __nNZG()->void:
	var __2E7f:String
	var __kZCM:String
	while!__HJIN.__itUF():
		var __1LNz:String=__HJIN.__CgnK()
		if __1LNz=="\n" or(__Ci44(__1LNz)and(__1LNz!="." or!__kZCM))or(__4ZjW(__1LNz)and!__kZCM):
			break
		if __1LNz=="'" or __1LNz=='"':
			__kZCM=""
			if __2E7f=="$":
				__kZCM=__1LNz
		__2E7f+=__1LNz
		__HJIN.get_next()
	__j8By(__2E7f)
func __wjRL(__rW4h:int,__qg_q:int,__llAW:__Hk3U)->void:
	__EHK2[__rW4h].__z44N(__qg_q,__llAW)
func __V57M()->void:
	__8WPv(__PUrc(__4ZjW).length())
func __CgnK(__WERA:int=1)->__Hk3U:
	return __Rv8p[__vHTD+__WERA]if __vHTD+__WERA<__Rv8p.size()and __vHTD+__WERA>=0 else null
const __Hk3U:=preload("token.gd")
func reset()->void:
	__vHTD=-1
func __YXR_(__9tt6:String)->void:
	__Tmk6(__Hk3U.Type.__WomU,__9tt6)
func __PUrc(___cTj:Callable)->String:
	var __I0up:String
	while!__HJIN.__itUF():
		var __0NqQ:String=__HJIN.__CgnK()
		if!___cTj.call(__0NqQ):
			return __I0up
		__I0up+=__0NqQ
		__HJIN.get_next()
	return __I0up
func __A5bE()->void:
	var __AXV2:String=__PUrc(_is_valid_identifier)
	if __GI3l(__AXV2):
		__T8IL(__AXV2)
	elif __d20S(__AXV2):
		__O_5N(__AXV2)
	else:
		__wr59(__AXV2)
var __f5GI:int
func __Ci44(__wr92:String)->bool:
	return __cKXr.contains(__wr92)
func _is_valid_identifier(__7wPa:String)->bool:
	return TextServerManager.get_primary_interface().is_valid_letter(__7wPa.unicode_at(0))or __KUjT.contains(__7wPa)
func __d20S(__hAZp:String)->bool:
	return __oPna.has(__hAZp)
func __0K6s()->void:
	__Tmk6(__Hk3U.Type.__4sWf,"\n")
func __6VjV(__8G3C:int,__kd3I:__WYjq)->void:
	__EHK2.insert(__8G3C,__kd3I)
func get_next()->__Hk3U:
	__vHTD+=1
	return __Rv8p[__vHTD]if __vHTD<__Rv8p.size()else null
const __0nLl:Array[String]=["extends","class_name","@tool","@onready","setget","const","signal","enum","static","var","func","@rpc","class","pass","if","else","elif","while","for","in","match","continue","break","return","assert","yield","await","preload","load","as","and","or","not"]
const __KUjT:String="1234567890_@"
var __HJIN:__gccm
var __EHK2:Array[__WYjq]
var ___nHT:int
func __sZyy(__qn3J:String)->void:
	__Tmk6(__Hk3U.Type.__RzGh,__qn3J)
func __vddi()->void:
	__mFTQ(__PUrc(__V5hC))
func __guJl()->bool:
	if __HJIN.__itUF():
		return false
	if __HJIN.__CgnK(1)=="\\" and __HJIN.__CgnK(2)=="\n":
		__HJIN.get_next()
		__HJIN.get_next()
		return true
	elif __HJIN.__CgnK()=="\n":
		__HJIN.get_next()
		__0K6s()
		__f5GI+=1
		__EHK2.append(__WYjq.new())
		return true
	var __a2DU:String=__HJIN.__CgnK()
	if __4ZjW(__a2DU):
		if __HJIN.__BJ4Z()==0:
			__V57M()
		else:
			__53e1()
	elif __a2DU=="#":
		__RxKS()
	elif __Ci44(__a2DU):
		__YXR_(__HJIN.get_next())
	elif __iKI5(__a2DU):
		__cRLq()
	elif "\"'".contains(__a2DU):
		__zTci()
	elif __a2DU=="$":
		__nNZG()
	elif __V5hC(__a2DU):
		__vddi()
	elif _is_valid_identifier(__a2DU):
		__A5bE()
	else:
		__HJIN.get_next()
		__V4Hf.__FY8X("ERROR: Tokenizer._read_next_token() - Invalid character '"+__a2DU+"' at "+__HJIN.__N6eo())
	return true
func __Uc4i(__lnO_:__WYjq)->int:
	return __EHK2.find(__lnO_)
const __7Lti:=preload("../../../settings.gd")
func __7HcE(__0xEp:String)->String:
	var __PdXO:String
	while!__HJIN.__itUF():
		var __jlk2:String=__HJIN.__CgnK()
		if __0xEp.contains(__jlk2):
			return __PdXO
		__PdXO+=__jlk2
		__HJIN.get_next()
	return __PdXO
