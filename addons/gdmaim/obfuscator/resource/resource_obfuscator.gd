extends RefCounted
const __YAHe:=preload("../symbol_table.gd")
func set_data(__6Zls:String)->void:
	_data=__6Zls
const __7Lti:=preload("../../settings.gd")
func __No_z(__MHdM:String,__X0yl:__YAHe)->bool:
	__n5lt=__MHdM
	_data=""
	var __vSZZ:PackedStringArray=__MHdM.split("\n")
	var __SAmu:int=0
	while __SAmu<__vSZZ.size():
		var __UhUR:String=__vSZZ[__SAmu]
		if __UhUR.begins_with("\""):
			_data+=__UhUR+"\n"
			__SAmu+=1
			continue
		if __UhUR.begins_with('[connection signal="')or __UhUR.begins_with('[node name="'):
			var __8jdI:bool=false
			var __N7AC:PackedStringArray=__UhUR.split(" ",false)
			for __FkOn in __N7AC:
				if __FkOn.begins_with('signal="')or __FkOn.begins_with('method="')or __FkOn.begins_with('node_paths=PackedStringArray("')or __8jdI:
					__8jdI=(__FkOn.begins_with("node_paths")or __8jdI)and __FkOn[-1]==","
					var __8MpR:int=__FkOn.find('"')
					var __w2hw:int=__FkOn.find('"',__8MpR+1)
					if __w2hw==-1:
						continue
					var __7Grc:String=__FkOn.substr(__8MpR+1,__w2hw-(__8MpR+1))
					var __PYwG:__YAHe.__OrFi=__X0yl.__80Rc(__7Grc)
					if __PYwG:
						__UhUR=__gthA(__UhUR,__7Grc,str(__PYwG.name))
						__V4Hf.__FY8X(str(__SAmu+1)+" found symbol '"+__7Grc+"' = "+str(__PYwG.name))
		_data+=__UhUR+"\n"
		__SAmu+=1
		if __UhUR.begins_with("[node")or __UhUR.begins_with("[sub_resource")or __UhUR.begins_with("[resource"):
			var __Sx7w:String
			var __4UxS:bool=__UhUR.contains("instance=")or __UhUR.contains('type="Animation"')
			var __HPn4p:int=__SAmu
			while __HPn4p<__vSZZ.size():
				if __vSZZ[__HPn4p].begins_with("["):
					break
				__Sx7w+=__vSZZ[__HPn4p]+"\n"
				var __VRbj:PackedStringArray=__vSZZ[__HPn4p].split(" = ",false,1)
				if __VRbj.size()==2 and __VRbj[0]=="script":
					__4UxS=true
					__V4Hf.__FY8X(str(__SAmu+1)+" found script "+__UhUR+" "+__VRbj[1])
				__HPn4p+=1
			if!__4UxS:
				_data+=__Sx7w
				__SAmu=__HPn4p
			else:
				__HPn4p=mini(__HPn4p,__vSZZ.size())
				while __SAmu<__HPn4p:
					__UhUR=__vSZZ[__SAmu]
					var __VCX5:PackedStringArray=__UhUR.split(" = ",false,1)
					if __VCX5.size()==2:
						if __VCX5[1].begins_with("NodePath(")and __VCX5[1].contains(":"):
							var __HIxb:String=__zTci(__VCX5[1])
							var __jZNc:PackedStringArray=__HIxb.split(":",false)
							var __Pkwt:String=__jZNc[0]
							for __sX3Y in __jZNc.slice(1):
								var __9a4Y:__YAHe.__OrFi=__X0yl.__80Rc(__sX3Y)
								__Pkwt+=":"+(str(__9a4Y.name)if __9a4Y else __sX3Y)
							__VCX5[1]='NodePath("'+__Pkwt+'")'
							__UhUR=__VCX5[0]+" = "+__VCX5[1]
							if __HIxb!=__Pkwt:
								__V4Hf.__FY8X(str(__SAmu+1)+" found node path '"+__HIxb+"' = "+__Pkwt)
						var __Ks78:__YAHe.__OrFi=__X0yl.__80Rc(__VCX5[0])
						if __Ks78:
							__UhUR=str(__Ks78.name)+" = "+__VCX5[1]
							__V4Hf.__FY8X(str(__SAmu+1)+" found export var '"+__VCX5[0]+"' = "+str(__Ks78.name))
					elif __UhUR.begins_with('"method":'):
						var __n28U:String=__zTci(__UhUR.trim_prefix('"method":'))
						var __7gMK:__YAHe.__OrFi=__X0yl.__80Rc(__n28U)
						if __7gMK:
							__UhUR='"method": &"'+str(__7gMK.name)+'"'
							__V4Hf.__FY8X(str(__SAmu+1)+" found method '"+__n28U+"' = "+str(__7gMK.name))
					_data+=__UhUR+"\n"
					__SAmu+=1
	_data=_data.strip_edges(false,true)+"\n"
	return true
var path:String
const __V4Hf:=preload("../../logger.gd")
func get_data()->String:
	return _data
var __n5lt:String
var _data:String
func _init(__ddiB:String)->void:
	self.path=__ddiB
func __gthA(__1UIw:String,__0XiN:String,__3Y_U:String)->String:
	var __5NJL:int=__1UIw.find(__0XiN)
	if __5NJL==-1:
		return __1UIw
	elif __5NJL==0:
		return __3Y_U+__1UIw.substr(__5NJL+__0XiN.length())
	else:
		return __1UIw.substr(0,__5NJL)+__3Y_U+__1UIw.substr(__5NJL+__0XiN.length())
func __GSim()->String:
	return __n5lt
func __zTci(__M9Ey:String)->String:
	var __MQ2P:String
	var __eV2t:String
	for __BfSC in __M9Ey:
		if __BfSC=="'" or __BfSC=='"':
			if __eV2t:
				return __MQ2P
			__eV2t=__BfSC
		elif __eV2t:
			__MQ2P+=__BfSC
	return __MQ2P
