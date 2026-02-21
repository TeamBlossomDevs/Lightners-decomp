extends RefCounted
var __cpMt:int
func __XpgU(__aQYE:__OzRr.__dSe_)->__OzRr.__oqEl:
	var __aerK:__Hk3U=__pW7p.get_next()
	if!__aerK.__AwRr():
		__V4Hf.__FY8X("ERROR: Parser._parse_class() - Symbol expected!")
		return null
	var __lg6a:=__OzRr.__oqEl.new(__aQYE)
	var __SDWI:String=__aerK.get_value()
	var __rCNH:int=__cpMt
	if __pW7p.__CgnK().__GMb9("extends"):
		__pW7p.get_next()
		__lg6a.__V32mr=__eoRH(__lg6a)
	__lg6a.__nbLqJ=__CsLc.__wh7Y(__SDWI)
	__lg6a.__1JjVo=__D4cc(__lg6a,__rCNH)
	__aerK.__jB7K(__lg6a.__nbLqJ)
	if __A7fl(__nQMo.__HwW2):
		__CsLc.__CSim(__lg6a.__nbLqJ)
	if __cesA:
		__cesA.add_child(__lg6a.__nbLqJ)
	return __lg6a
func __VHDT()->void:
	var __Z3eu:__Hk3U=__pW7p.get_next()
	__cpMt=__Z3eu.get_value().length()
func __YEzP(__4qSi:__OzRr.__dSe_)->__OzRr.__KTY7:
	var __fxAW:=__OzRr.__KTY7.new(__4qSi)
	var __HhZq:int=__cpMt
	var __oAbv:__Hk3U=__pW7p.get_next()
	var __Lvn9:=__OzRr.__LMEE.new(__fxAW)
	__Lvn9.__nbLqJ=__CsLc.__cFnK(__fxAW,__oAbv.get_value(),__JS6z(__fxAW))
	__fxAW.__et0v0=__Lvn9
	__fxAW.__UXvX=__D7Cc(__fxAW,":")
	__fxAW.__1JjVo=__D4cc(__fxAW,__HhZq)
	__oAbv.__jB7K(__Lvn9.__nbLqJ)
	if __A7fl(__nQMo.__HwW2):
		__CsLc.__CSim(__Lvn9.__nbLqJ)
	return __fxAW
func __urod(__wtH5:__OzRr.__dSe_)->__OzRr.__SyVj:
	var __ZqOX:=__OzRr.__SyVj.new(__wtH5)
	__ZqOX.__1JjVo=__D4cc(__ZqOX,__cpMt)
	return __ZqOX
var __cesA:__YAHe.__OrFi
func __djdk(__Royg:__OzRr.__3db1)->__OzRr.__3db1.__5Ab3:
	var __N9PJ:__Hk3U=__pW7p.get_next()
	if!__N9PJ.__AwRr():
		__V4Hf.__FY8X("ERROR: Parser._parse_enum_key() - Symbol expected!")
		return null
	var __JY1F:=__OzRr.__3db1.__5Ab3.new(__Royg)
	__JY1F.__nbLqJ=__CsLc.__wh7Y(__N9PJ.get_value())
	__N9PJ.__jB7K(__JY1F.__nbLqJ)
	if __A7fl(__nQMo.__HwW2):
		__CsLc.__CSim(__JY1F.__nbLqJ)
	__Royg.__nbLqJ.add_child(__JY1F.__nbLqJ)
	__N9PJ=__pW7p.__CgnK()
	if __N9PJ.__0P3a("="):
		__pW7p.get_next()
		__JY1F.__UXvX=__D7Cc(__JY1F)
	else:
		__JY1F.__UXvX=__OzRr.__Z7VQ.new(__JY1F)
	return __JY1F
func __JS6z(__PfH4:__OzRr.__dSe_)->String:
	if __pW7p.__CgnK(1).__lz51(":")and!__pW7p.__CgnK(2).__0P3a("="):
		__pW7p.get_next()
		var __lb3l:__YAHe.__yQyK=__eoRH(__PfH4)
		return str(__lb3l)
	return ""
var __CsLc:__YAHe
func __D4cc(__spz2:__OzRr.__dSe_,__fiOU:int)->__OzRr.__DnFs:
	var __hKaG:=__OzRr.__DnFs.new(__spz2)
	__hKaG.__wGTG=__pW7p.__CgnK(1)
	var __GD2R:__WLcI.__WYjq=null
	while!__pW7p.__itUF():
		var __AYIf:__Hk3U=__pW7p.__CgnK(1)
		var __kGLt:__WLcI.__WYjq=__pW7p.__t3fv(__AYIf.__SYI0i)
		if __GD2R and __GD2R!=__kGLt and __kGLt.__RNqr()and __kGLt.__mrv7()<=__fiOU:
			break
		else:
			__GD2R=__kGLt
		if __spz2 is __OzRr.__SyVj and __AYIf.__lz51(":")and __kGLt.__mrv7()==__fiOU+1:
			__hKaG.__jAWw.append(__D4cc(__hKaG,__fiOU+1))
		else:
			var __r3m1:__OzRr.__dSe_=__b3Qw(__hKaG)
			if __r3m1:
				__hKaG.__jAWw.append(__r3m1)
	__hKaG.__MdLL=__pW7p.__CgnK(0)
	return __hKaG
func __A7fl(__sAOa:String,__pNR5:int=0)->bool:
	var __wsCI:__WLcI.__WYjq=__pW7p.__t3fv(__pW7p.__CgnK(0).__SYI0i+__pNR5)
	return __wsCI.__OhxCu.has(__sAOa)if __wsCI else false
func __d9S2(__HfTx:__OzRr.__dSe_)->__OzRr.__1DOi:
	var __WFWU:__Hk3U=__pW7p.get_next()
	if!__WFWU.__AwRr():
		__V4Hf.__FY8X("ERROR: Parser._parse_var() - Symbol expected!")
		return null
	var __lqJH:bool=__pW7p.__CgnK(-2).__GMb9("static")
	var __22HW:=__OzRr.__1DOi.new(__HfTx)
	__22HW.__nbLqJ=__CsLc.__cFnK(__22HW,__WFWU.get_value(),__JS6z(__22HW))
	__WFWU.__jB7K(__22HW.__nbLqJ)
	if __A7fl(__nQMo.__HwW2):
		__CsLc.__CSim(__22HW.__nbLqJ)
	if __cesA and(__m9NT or __lqJH):
		__cesA.add_child(__22HW.__nbLqJ)
	return __22HW
var __pW7p:__WLcI
func __cJE5(__JloY:__OzRr.__dSe_)->__OzRr.__dSe_:
	var __N46X:__Hk3U=__pW7p.get_next()
	if __N46X.get_value().begins_with("@export"):
		if __pW7p.__CgnK().__lz51("("):
			___vCI("(",")")
		while __pW7p.get_next().get_value()!="var":
			pass
		return __ZBHd(__JloY)
	match __N46X.get_value():
		"class_name":
			__FBFD(__JloY)
		"extends":
			__Af4V(__JloY)
		"class":
			return __XpgU(__JloY)
		"signal":
			return __UZRO(__JloY)
		"enum":
			return __bvh9(__JloY)
		"const":
			return __fSSd(__JloY)
		"var":
			return __d9S2(__JloY)
		"func":
			return __w5za(__JloY)
		"if":
			return __FJv5(__JloY)
		"else":
			return __3JEy(__JloY)
		"elif":
			return __aEvI(__JloY)
		"match":
			return __urod(__JloY)
		"for":
			return __YEzP(__JloY)
		"while":
			return __LTj9(__JloY)
	return null
func __fSSd(__24ZK:__OzRr.__dSe_)->__OzRr.__wnak:
	var __yc7o:__Hk3U=__pW7p.get_next()
	if!__yc7o.__AwRr():
		__V4Hf.__FY8X("ERROR: Parser._parse_const() - Symbol expected!")
		return null
	var __Mi3k:=__OzRr.__wnak.new(__24ZK)
	__Mi3k.__nbLqJ=__CsLc.__cFnK(__Mi3k,__yc7o.get_value(),__JS6z(__Mi3k))
	__yc7o.__jB7K(__Mi3k.__nbLqJ)
	if __A7fl(__nQMo.__HwW2):
		__CsLc.__CSim(__Mi3k.__nbLqJ)
	if __cesA:
		__cesA.add_child(__Mi3k.__nbLqJ)
	return __Mi3k
func __S2Xh()->void:
	__pW7p.get_next()
	__cpMt=0
func __FBFD(__0hXk:__OzRr.__dSe_)->void:
	var __FxoT:__Hk3U=__pW7p.get_next()
	if!__FxoT.__AwRr():
		__V4Hf.__FY8X("ERROR: Parser._parse_class_name() - Symbol expected!")
		return
	var __Lpsn:__OzRr.__dSe_=__0hXk
	while __Lpsn.get_parent()and not __Lpsn is __OzRr.__oqEl:
		__Lpsn=__Lpsn.get_parent()
	__cesA=__CsLc.__wh7Y(__FxoT.get_value())
	__Lpsn.__nbLqJ=__cesA
	__FxoT.__jB7K(__Lpsn.__nbLqJ)
func ___vCI(__O2VH:String,__vahj:String)->void:
	var __pQqn:int=0
	while!__pW7p.__itUF():
		var __GIOn:__Hk3U=__pW7p.get_next()
		if __GIOn.__lz51():
			if __GIOn.get_value()==__O2VH:
				__pQqn+=1
			elif __GIOn.get_value()==__vahj:
				__pQqn-=1
				if __pQqn<=0:
					return
func __CD9G()->bool:
	var __eeuN:int=1
	var __Zyr1:__Hk3U=__pW7p.__CgnK(__eeuN)
	while __Zyr1 and(__Zyr1.__AwRr()or __Zyr1.__lz51(".")):
		__eeuN+=1
		__Zyr1=__pW7p.__CgnK(__eeuN)
	return __Zyr1.__lz51("(")if __Zyr1 else false
const __gccm:=preload("../tokenizer/stream.gd")
func ___6E8(__bve_:__Hk3U)->bool:
	return __bve_ and __bve_.type!=__Hk3U.Type.__opIF and __bve_.type!=__Hk3U.Type.__rtVp and __bve_.type!=__Hk3U.Type.__y04f and __bve_.type!=__Hk3U.Type.__4sWf 
const __V4Hf:=preload("../../../logger.gd")
func __bvh9(__dFLo:__OzRr.__dSe_)->__OzRr.__3db1:
	var __ualW:__Hk3U=__pW7p.get_next()
	if!__ualW.__AwRr():
		__V4Hf.__FY8X("ERROR: Parser._parse_enum() - Symbol expected!")
		return null
	var __guQv:=__OzRr.__3db1.new(__dFLo)
	__guQv.__nbLqJ=__CsLc.__wh7Y(__ualW.get_value())
	__ualW.__jB7K(__guQv.__nbLqJ)
	if __A7fl(__nQMo.__HwW2):
		__CsLc.__CSim(__guQv.__nbLqJ)
	var __XTGK:bool=true
	while!__pW7p.__itUF():
		__ualW=__pW7p.__CgnK()
		if __ualW.__AwRr():
			if __XTGK:
				__guQv.keys.append(__djdk(__guQv))
				__XTGK=false
				continue
			else:
				__dFLo.__jAWw.append(__AsI_(__dFLo))
		elif __ualW.__lz51(","):
			__XTGK=true
		elif __ualW.__lz51("}"):
			break
		__pW7p.get_next()
	if __cesA:
		__cesA.add_child(__guQv.__nbLqJ)
	return __guQv
func __w5za(__oXJz:__OzRr.__dSe_)->__OzRr.__WVv_:
	var __jg9n:__Hk3U=__pW7p.__CgnK()
	var __S6TL:String="@lambda"
	var __Nc9U:bool=false
	var __1StL:bool=__A7fl(__nQMo.__HwW2)
	var __iXcG:bool=__A7fl(__nQMo.__oqNF,-1)
	var __E5JJ:PackedStringArray=__36_R(__nQMo.__oqNF,-1).split(" ",false)
	if __jg9n.__AwRr():
		__pW7p.get_next()
		__S6TL=__jg9n.get_value()
		__Nc9U=__pW7p.__CgnK(-2).__GMb9("static")
	var __XYNw:int=__cpMt
	var __HBmM:=__OzRr.__WVv_.new(__oXJz)
	var __VrV1:Array[__OzRr.Parameter]=__wiXP(__HBmM)
	var __W2j8:String=__bLy1(__HBmM)
	__HBmM.__nbLqJ=__CsLc.__cFnK(__HBmM,__S6TL,__W2j8)
	__HBmM.__oH2yS=__VrV1
	__HBmM.__1JjVo=__D4cc(__HBmM,__XYNw)
	if __jg9n.__AwRr():
		__jg9n.__jB7K(__HBmM.__nbLqJ)
		if __1StL:
			__CsLc.__CSim(__HBmM.__nbLqJ)
	if __iXcG:
		for __KFRC in __VrV1.size():
			if __E5JJ.has(__VrV1[__KFRC].__nbLqJ.get_name()):
				__HBmM.__nbLqJ.__Tc6y(__KFRC)
	if __cesA and(__m9NT or __Nc9U):
		__cesA.add_child(__HBmM.__nbLqJ)
	return __HBmM
func __LTj9(__MsRE:__OzRr.__dSe_)->__OzRr.__grJF:
	var __fBtM:=__OzRr.__grJF.new(__MsRE)
	var __Jszc:int=__cpMt
	__fBtM.condition=__D7Cc(__fBtM,":")
	__fBtM.__1JjVo=__D4cc(__fBtM,__Jszc)
	return __fBtM
func __3JEy(__1B8L:__OzRr.__dSe_)->__OzRr.__l7ga:
	if __pW7p.__CgnK(-1).type!=__Hk3U.Type.__y04f:
		return null 
	var __X9BR:=__OzRr.__l7ga.new(__1B8L)
	var __KMqp:int=__cpMt
	__X9BR.__1JjVo=__D4cc(__X9BR,__KMqp)
	return __X9BR
func __k4fU(__z0nU:__OzRr.__dSe_)->__OzRr.__S0Vc:
	var __FE52:=__OzRr.__S0Vc.new(__z0nU)
	__FE52.target=__eoRH(__FE52)
	__FE52.__0wq0=__pW7p.get_next().get_value()
	__FE52.__UXvX=__D7Cc(__FE52)
	return __FE52
const __WLcI:=preload("../tokenizer/tokenizer.gd")
func __2lH8(__weYp:__OzRr.__dSe_)->__OzRr.__sDwr:
	var ___oBD:=__OzRr.__sDwr.new(__weYp)
	___oBD.path=__eoRH(___oBD)
	___oBD.__19CPQ=__ETUR(___oBD)
	return ___oBD
func __UZRO(__btWS:__OzRr.__dSe_)->__OzRr.__hiVS:
	var __s6GJ:__Hk3U=__pW7p.get_next()
	if!__s6GJ.__AwRr():
		__V4Hf.__FY8X("ERROR: Parser._parse_signal() - Symbol expected!")
		return null
	var __UR1J:=__OzRr.__hiVS.new(__btWS)
	__UR1J.__nbLqJ=__CsLc.__wh7Y(__s6GJ.get_value())
	__UR1J.__oH2yS=__wiXP(__btWS)
	__s6GJ.__jB7K(__UR1J.__nbLqJ)
	if __A7fl(__nQMo.__HwW2):
		__CsLc.__CSim(__UR1J.__nbLqJ)
	if __cesA and __m9NT:
		__cesA.add_child(__UR1J.__nbLqJ)
	return __UR1J
func __AsI_(__vK9P:__OzRr.__dSe_)->__OzRr.__OrFi:
	var __9_nf:=__OzRr.__OrFi.new(__vK9P)
	__9_nf.path=__eoRH(__9_nf)
	return __9_nf
func __ETUR(__DKax:__OzRr.__dSe_)->Array[__OzRr.__Z7VQ]:
	var __27Ln:Array[__OzRr.__Z7VQ]
	while!__pW7p.__itUF():
		var __M5qX:__Hk3U=__pW7p.__CgnK()
		if __M5qX.__lz51("(")or __M5qX.__lz51(","):
			__pW7p.get_next()
			__D7Cc(__DKax)
		elif __M5qX.__lz51(")"):
			__pW7p.get_next()
			break
		else:
			__V4Hf.__FY8X("ERROR: Parser._parse_args() - Unexpected token '"+str(__M5qX)+"'!")
			return __27Ln
	return __27Ln
func __eoRH(__2bg7:__OzRr.__dSe_)->__YAHe.__yQyK:
	var __i13K:__YAHe.__yQyK=__CsLc.__N0JH(__2bg7)
	__i13K.__reiEz=!__pW7p.__CgnK(0)or!__pW7p.__CgnK(0).__lz51(".")
	__i13K.__ULDG(__V4Hf.__CwAM)
	__i13K.__SYI0i=__pW7p.__CgnK().__SYI0i
	while!__pW7p.__itUF():
		var __9uWw:__Hk3U=__pW7p.__CgnK()
		if __9uWw.__lz51("."):
			__pW7p.get_next()
			continue
		elif __9uWw.__AwRr():
			__pW7p.get_next()
			var __vzsJ:__YAHe.__OrFi=__i13K.__FuYx(__9uWw.get_value())
			__9uWw.__jB7K(__vzsJ)
			continue
		break
	__i13K.__e2MK=__pW7p.__CgnK().__lz51("(")
	return __i13K
func __Pjzt()->__YAHe.__OrFi:
	return __cesA 
func __lGiG(__FcVQ:int=0)->Dictionary:
	var __bCKQ:__WLcI.__WYjq=__pW7p.__t3fv(__pW7p.__CgnK(0).__SYI0i+__FcVQ)
	return __bCKQ.__OhxCu if __bCKQ else{}
func __36_R(__j13A:String,__LbIm:int=0)->String:
	var __ZgVu:__WLcI.__WYjq=__pW7p.__t3fv(__pW7p.__CgnK(0).__SYI0i+__LbIm)
	return __ZgVu.__OhxCu.get(__j13A,"")if __ZgVu else ""
const __Hk3U:=preload("../tokenizer/token.gd")
func __b3Qw(__oGzz:__OzRr.__dSe_)->__OzRr.__dSe_:
	var __wKG7:__Hk3U=__pW7p.__CgnK()
	match __wKG7.type:
		__Hk3U.Type.__4sWf:
			__S2Xh()
			return null
		__Hk3U.Type.__y04f:
			__VHDT()
			return null
		__Hk3U.Type.__W_qr:
			return __AsI_(__oGzz)
		__Hk3U.Type.__ZQBT:
			return __cJE5(__oGzz)
	__pW7p.get_next()
	return null
const __OzRr:=preload("ast.gd")
var __m9NT:bool
func __ZBHd(__TL7u:__OzRr.__dSe_)->__OzRr.__ckzp:
	var __Ykxk:__Hk3U=__pW7p.get_next()
	if!__Ykxk.__AwRr():
		__V4Hf.__FY8X("ERROR: Parser._parse_export_var() - Symbol expected!")
		return null
	var __W5QA:=__OzRr.__ckzp.new(__TL7u)
	__W5QA.__nbLqJ=__CsLc.__a5EN(__Ykxk.get_value(),__JS6z(__W5QA))
	__Ykxk.__jB7K(__W5QA.__nbLqJ)
	if __A7fl(__nQMo.__HwW2):
		__CsLc.__CSim(__W5QA.__nbLqJ)
	if __cesA and __m9NT:
		__cesA.add_child(__W5QA.__nbLqJ)
	return __W5QA
const __nQMo:=preload("../preprocessor_hints.gd")
func __Af4V(__sXCw:__OzRr.__dSe_)->void:
	var __AVez:__Hk3U=__pW7p.__CgnK()
	if!__AVez.__AwRr():
		__V4Hf.__FY8X("ERROR: Parser._parse_extends() - Symbol expected!")
		return
	var __lz3s:__OzRr.__dSe_=__sXCw
	while __lz3s.get_parent()and not __lz3s is __OzRr.__oqEl:
		__lz3s=__lz3s.get_parent()
	__lz3s.__V32mr=__eoRH(__lz3s)
func __D7Cc(__O7AI:__OzRr.__dSe_,__rFz3:String="")->__OzRr.__Z7VQ:
	var __uFD1:=__OzRr.__Z7VQ.new(__O7AI)
	return __uFD1
func __bLy1(__7RmG:__OzRr.__dSe_)->String:
	if __pW7p.__CgnK(1).__0P3a("->"):
		__pW7p.get_next()
		var __e9MC:__YAHe.__yQyK=__eoRH(__7RmG)
		return str(__e9MC)
	return ""
func __FJv5(__Hc4T:__OzRr.__dSe_)->__OzRr.__kNtn:
	if __pW7p.__CgnK(-1).type!=__Hk3U.Type.__y04f:
		return null 
	var __joL6:=__OzRr.__kNtn.new(__Hc4T)
	var __dH6u:int=__cpMt
	__joL6.condition=__D7Cc(__joL6,":")
	__joL6.__1JjVo=__D4cc(__joL6,__dH6u)
	return __joL6
func __wiXP(__CfGh:__OzRr.__dSe_)->Array[__OzRr.Parameter]:
	var __84MI:Array[__OzRr.Parameter]
	if __pW7p.__itUF()or!__pW7p.__CgnK().__lz51("("):
		return __84MI
	var __2qwu:int=0
	var __1wx1:=__OzRr.Parameter.new(__CfGh)
	var __yGDK:bool=true
	while!__pW7p.__itUF():
		var __UfeA:__Hk3U=__pW7p.__CgnK()
		if __UfeA.__lz51():
			__pW7p.get_next()
			if __UfeA.__6mFf("("):
				__2qwu+=1
			elif __UfeA.__6mFf(")"):
				__2qwu-=1
				if __2qwu<=0:
					if __1wx1.__nbLqJ:
						__84MI.append(__1wx1)
					__1wx1=__OzRr.Parameter.new(__CfGh)
					return __84MI
			elif __UfeA.__6mFf(",")and __2qwu==1:
				__yGDK=true
				__84MI.append(__1wx1)
				__1wx1=__OzRr.Parameter.new(__CfGh)
		elif __UfeA.__AwRr():
			if __yGDK:
				__pW7p.get_next()
				__yGDK=false
				__1wx1.__nbLqJ=__CsLc.__srOQ(__UfeA.get_value(),__JS6z(__1wx1))
				__UfeA.__jB7K(__1wx1.__nbLqJ)
				if __A7fl(__nQMo.__HwW2):
					__CsLc.__CSim(__1wx1.__nbLqJ)
			else:
				__eoRH(__CfGh)
		else:
			__pW7p.get_next()
	return __84MI
func read(__1ZIm:__WLcI,__wbIB:__YAHe,__DNk8:__YAHe.__OrFi=null)->__OzRr.__dSe_:
	__pW7p=__1ZIm
	__CsLc=__wbIB
	__cesA=__DNk8
	__m9NT=__DNk8!=null
	var __GbMs:=__OzRr.__oqEl.new(null)
	__GbMs.__1JjVo=__D4cc(__GbMs,-1)
	__CsLc=null
	return __GbMs
const __YAHe:=preload("../../symbol_table.gd")
func __aEvI(__KJWx:__OzRr.__dSe_)->__OzRr.__EgWu:
	if __pW7p.__CgnK(-1).type!=__Hk3U.Type.__y04f:
		return null 
	var __bWUW:=__OzRr.__EgWu.new(__KJWx)
	var __k20l:int=__cpMt
	__bWUW.condition=__D7Cc(__bWUW,":")
	__bWUW.__1JjVo=__D4cc(__bWUW,__k20l)
	return __bWUW
