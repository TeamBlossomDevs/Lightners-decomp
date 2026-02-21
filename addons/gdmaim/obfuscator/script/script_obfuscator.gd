extends RefCounted
func __PzKl(__m7BC:__Hk3U)->void:
	if!__m7BC.__LEmi():
		return
	var __AHhF:String=__m7BC.get_value()
	__m7BC.set_value(__AHhF[0]+__CsLc.__nrZ7(__AHhF.substr(1,__AHhF.length()-2))+__AHhF[-1])
var __CsLc:__YAHe
var path:String
func parse(__pssc:String,__4x3v:__YAHe,__i3ut:__YAHe.__OrFi=null)->void:
	self.source_code=__pssc
	__CsLc=__4x3v
	__1zkBW=__WLcI.new()
	__1zkBW.read(__pssc)
	__B9sP=__5Vns.new()
	__YLQ8=__B9sP.read(__1zkBW,__4x3v,__i3ut)
func __oe27()->Array[Dictionary]:
	var __CkdA:Dictionary
	var __9XMI:Dictionary
	var __zKy0:Array[__WLcI.__WYjq]=__1zkBW.__bv6m()
	for __ym74x in __zKy0.size():
		var __vqz8:__WLcI.__WYjq=__zKy0[__ym74x]
		for __I5wB in __vqz8.__LHk_O:
			if __I5wB.__SYI0i!=-1:
				__CkdA[__I5wB.__SYI0i]=__ym74x
				__9XMI[__ym74x]=__I5wB.__SYI0i
				break
	__CkdA[__1zkBW.__f5GI-1]=__zKy0.size()
	__9XMI[__zKy0.size()]=__1zkBW.__f5GI-1
	var __Pr7h:int=0
	for __kAoC in __1zkBW.__f5GI:
		var ___NAp:int=__CkdA.get(__kAoC,__Pr7h)
		__Pr7h=___NAp
		__CkdA[__kAoC]=___NAp
	return[__CkdA,__9XMI]
const __nQMo:=preload("preprocessor_hints.gd")
var source_code:String
func __j3cC()->void:
	var __6daz:=RegEx.new()
	if __7Lti.current.__BSJG and __7Lti.current.__2N5n:
		__6daz.compile(__7Lti.current.__2N5n)
	var __bQLk:Array[__WLcI.__WYjq]=__1zkBW.__bv6m()
	for __sV5mQ in range(__bQLk.size()-1,-1,-1):
		var __qzEM:__WLcI.__WYjq=__bQLk[__sV5mQ]
		if __7Lti.current.__THFi or __7Lti.current.__dcgg:
			for __yYVE in range(__qzEM.__LHk_O.size()-1,-1,-1):
				var __njJW:__Hk3U=__qzEM.__LHk_O[__yYVE]
				if __7Lti.current.__THFi and __njJW.type==__Hk3U.Type.__opIF:
					__qzEM.__kD1N(__yYVE)
					continue
				if __7Lti.current.__dcgg:
					if __njJW.type==__Hk3U.Type.__y04f and(__yYVE==__qzEM.__LHk_O.size()-1 or __qzEM.__LHk_O[__yYVE+1].type==__Hk3U.Type.__4sWf):
						__qzEM.__kD1N(__yYVE)
						continue
					elif __njJW.type==__Hk3U.Type.__rtVp:
						var __JOkV:int=__qzEM.__LHk_O[__yYVE-1].type
						var __id2w:int=__qzEM.__LHk_O[__yYVE+1].type if __yYVE+1<__qzEM.__LHk_O.size()else __Hk3U.Type.NONE
						if __yYVE==0 or __JOkV==__Hk3U.Type.__RzGh or __JOkV==__Hk3U.Type.__WomU or __id2w==__Hk3U.Type.__RzGh or __id2w==__Hk3U.Type.__WomU:
							__qzEM.__kD1N(__yYVE)
							continue
		if __7Lti.current.__Kfb9 and str(__qzEM).replace(" ","").replace("\n","").replace("\t","").replace(";","").is_empty():
			__1zkBW.__SyZi(__sV5mQ)
			continue
		if __6daz.is_valid()and __6daz.search(str(__qzEM)):
			__1zkBW.__SyZi(__sV5mQ)
			continue
func __No_z(__pKJZ:PackedStringArray)->bool:
	if!__B9sP:
		__V4Hf.__FY8X("ERROR: ScriptObfuscator.run() - No parsed data!")
		return false
	__1zkBW.reset()
	while!__1zkBW.__itUF():
		var __PYBs:__Hk3U=__1zkBW.get_next()
		var __apJ3:__Hk3U=__1zkBW.__CgnK()
		var ___yDh:__WLcI.__WYjq=__1zkBW.__t3fv(__PYBs.__SYI0i)
		var ___G9z:__WLcI.__WYjq=__1zkBW.__t3fv(__PYBs.__SYI0i-1)
		if __7Lti.current.__fOrE:
			if ___yDh.__A8ru(__nQMo.__AGNY):
				__PzKl(__PYBs)
			__9OJJ(__PYBs,__apJ3)
		if!__7Lti.current.__myzp:
			continue
		if ___G9z and ___G9z.__A8ru(__nQMo.__4aFh):
			__BiZf(__PYBs,___yDh,___G9z.__4lbX(__nQMo.__4aFh),__pKJZ)
	if __7Lti.current.__fOrE and __7Lti.current.__vm8V:
		__cOdP()
	__j3cC()
	return true
const __OzRr:=preload("parser/ast.gd")
const __V4Hf:=preload("../../logger.gd")
const __Hk3U:=preload("tokenizer/token.gd")
func __9OJJ(__Ul0m:__Hk3U,__BgeH:__Hk3U)->void:
	if!__Ul0m.__nbLqJ or!__BgeH or!__BgeH.__lz51("("):
		return
	var __48TT:__YAHe.__OrFi=__Ul0m.__nbLqJ
	if!__48TT.__5CT6():
		return
	var __Ah8g:int=0
	var __lpMi:int=0
	var __jkCK:bool=true
	while!__1zkBW.__itUF():
		__Ul0m=__1zkBW.get_next()
		if __Ul0m.__lz51():
			if __Ul0m.__6mFf("("):
				__lpMi+=1
			elif __Ul0m.__6mFf(")"):
				__lpMi-=1
				if __lpMi<=0:
					break
			elif __Ul0m.__6mFf(",")and __lpMi==1:
				__Ah8g+=1
				__jkCK=true
			continue
		elif __jkCK and __Ul0m.__LEmi()and __48TT.__CS_I(__Ah8g):
			var __vXgD:String=__Ul0m.get_value()
			__Ul0m.set_value(__vXgD[0]+__CsLc.__nrZ7(__vXgD.substr(1,__vXgD.length()-2))+__vXgD[-1])
		__jkCK=false
const __7Lti:=preload("../../settings.gd")
func __iO7k()->String:
	__bsgC=__1zkBW.__iO7k()
	return __bsgC
const __WLcI:=preload("tokenizer/tokenizer.gd")
func _init(__QQh3:String)->void:
	self.path=__QQh3
const __5Vns:=preload("parser/parser.gd")
const __YAHe:=preload("../symbol_table.gd")
var __bsgC:String
var __YLQ8:__OzRr.__dSe_
func __cOdP()->void:
	var __oCua:Array[__WLcI.__WYjq]=__1zkBW.__bv6m()
	var __wBlm:Array
	var __cZX1:Array[Array]=[]
	var __BCTP:Array[Array]=[]
	var __9KPm:Array
	var __xdUU:bool
	var __XHtt=func(__z9PJ:Array,__KRTe:bool):
		if __z9PJ.is_empty():return
		if __KRTe:
			__cZX1.append(__z9PJ)
		else:
			__BCTP.append(__z9PJ)
	for __4uEX in __oCua.size():
		var __8otb:__WLcI.__WYjq=__oCua[__4uEX]
		var __8fBn:__WLcI.__WYjq=__oCua[__4uEX-1]if __4uEX>=1 else null
		var __ruML:__Hk3U=__8otb.__LHk_O[0]if __8otb.__LHk_O else null
		var __yhL0:__Hk3U=__8fBn.__LHk_O[0]if __8fBn and __8fBn.__LHk_O else null
		if __ruML and["@icon","@tool","class_name","extends"].has(__ruML.get_value()):
			__wBlm.append(__8otb)
			continue
		if __ruML and __ruML.get_value()=="@onready":
			__XHtt.call(__9KPm,__xdUU)
			__9KPm=[]
			__xdUU=true
		elif __8otb.__mrv7()==0 and __ruML and __ruML.__GMb9()and(!__yhL0 or(!__yhL0.__6mFf("@rpc")and!(__yhL0.get_value().begins_with("@export")and!__8fBn.__BUN2("var")))):
			__XHtt.call(__9KPm,__xdUU)
			__9KPm=[]
			__xdUU=false
		__9KPm.append(__8otb)
	__XHtt.call(__9KPm,__xdUU)
	var __HWtD:Dictionary
	var __F2Sf:=RandomNumberGenerator.new()
	var ___gT9:Dictionary
	for __yKh5 in __BCTP:
		var __d6Ek:int=0
		if __yKh5:
			__d6Ek=hash(__yKh5[0].to_string())
			___gT9[__d6Ek]=___gT9.get(__d6Ek,-1)+1
			__d6Ek+=___gT9[__d6Ek]
		__F2Sf.seed=hash(path)+path.length()+__CsLc.__aLN1+__d6Ek
		__HWtD[__yKh5]=__F2Sf.randi()
	__BCTP.sort_custom((func(__xHRX,__POf_):return __HWtD[__xHRX]>__HWtD[__POf_]))
	if __cZX1:
		var __3Q_S:int=0
		var __TkJR:int=mini(__BCTP.size()/__cZX1.size()*2,__BCTP.size()+1)
		__F2Sf.seed=hash(path)+path.length()+__CsLc.__aLN1
		for __FLnf in __cZX1:
			if __TkJR:
				__3Q_S+=maxi(1,__F2Sf.randi()%__TkJR)
			__BCTP.insert(mini(__3Q_S,__BCTP.size()),__FLnf)
	__oCua.clear()
	for __Qimg in[__wBlm]+__BCTP:
		__oCua.append_array(__Qimg)
var __1zkBW:__WLcI
func __BiZf(__qtcj:__Hk3U,__b4vU:__WLcI.__WYjq,__4ZME:String,__88ev:PackedStringArray)->void:
	if!__qtcj.__GMb9("func"):
		return
	if!__88ev.has(__4ZME):
		var __TLRU:int=__b4vU.__mrv7()
		var __7uuN:String=path.get_basename()+"."+__1zkBW.get_next().get_value()
		var __PvOk:String='printerr("ERROR: illegal call to '+"'"+__7uuN+"'!"+'");'
		var __nhOO:int=0
		while!__1zkBW.__itUF():
			__qtcj=__1zkBW.get_next()
			if __qtcj.__lz51("("):
				__nhOO+=1
			elif __qtcj.__lz51(")"):
				__nhOO-=1
				if __nhOO<=0:
					break
		__qtcj=__1zkBW.get_next()
		if __qtcj.__0P3a("->"):
			__qtcj=__1zkBW.get_next()
			var __xLmS:String=__qtcj.get_value()
			const __iyD9:Dictionary={
				"bool":"return false",
				"int":"return 0",
				"float":"return 0.0",
				"String":'return ""',
				"Array":"return []",
				"Array[int]":"return []",
				"Array[float]":"return []",
				"Dictionary":"return {}",
				"void":"",
			}
			__PvOk+=__iyD9.get(__xLmS,"return null")
		var __as5_:int=__1zkBW.__Uc4i(__b4vU)
		var __CmO7:int=__as5_+2
		var __N706:int=-1
		__1zkBW.__t3fv(__as5_+1).___Se9()
		__1zkBW.__t3fv(__as5_+1).__z44N(1,__Hk3U.new(__Hk3U.Type.__ZQBT,__PvOk,0,__as5_+1))
		while __CmO7<__1zkBW.__zTCw():
			var __m8Mc:__WLcI.__WYjq=__1zkBW.__t3fv(__CmO7)
			if __m8Mc.__RNqr():
				if __m8Mc.__mrv7()<=__TLRU:
					break
				__N706=__CmO7
			if __m8Mc.__LHk_O:
				__1zkBW.__hkt0(__m8Mc.__LHk_O[0])
			__CmO7+=1
		if __N706!=-1:
			for __xds8h in range(__as5_+2,__N706+1):
				__1zkBW.__t3fv(__xds8h).___Se9()
var __B9sP:__5Vns
func __Pjzt()->__YAHe.__OrFi:
	return __B9sP.__Pjzt()if __B9sP else null
