extends Node
func __py0z():
	if OS.get_name()=="Windows" or OS.get_name()=="Linux":
		get_window().title="Deltarune: Lightners Live Plus"
var __3JzN=false
var __7Rpg=""
var __WDY2=0
var __yAnJ="res://Charts/"
var __APE8=0
var __61x0=""
var __INba=0
var __7OLO="user://settings.save"
var __J7lQ=0
var __C3dv=0
enum __OxNx{
	__SlmO=77,
	__M3Vu=76,
	__hU_2=75,
	__nhnd=74,
	__IE6l=73,
	__R4Fk=70,
	__kJsI=69,
	__9DYS=68,
	__q5Zb=67,
	__vtpn=64,
	__nBB8=63,
	__i34K=62,
	__1gFr=61,
	__CpcD=60,
	__voJE=59,
	__HqTb=58,
	__CSyO=57,
	__V4Iy=56,
	__p3Af=55,
	__HmZu=54,
	__uG3Y=46,
	__pxdo=44,
	__X13L=42,
	__Eti0=39,
	__lnUc=38,
	__Ok5c=36,
	__WhQo=35,
	__aIOK=32,
	__Wjmg=30,
	__kmKG=28,
	__Hu24=50,
	__tDhu=48
}
var __fdcb=1
var __7ZAV=""
var __s9m7=true
var __QUav=0
func _ready():
	__1eNZ()
	__py0z()
var __NnDK=false
func __5Kpd(__ksJe):
	var __JSCA=str(var_to_bytes(__ksJe.tracks))
	var __0Vaq=__JSCA.md5_text()
	return __0Vaq
var __cmGH=[]
var __W58g=[]
var __ONPS=""
func __y64g(__ICLV:String)->String:
	var __lwvG=HashingContext.new()
	__lwvG.start(HashingContext.HASH_MD5)
	if ResourceLoader.exists(__ICLV):
		var __SZwn=ResourceLoader.load(__ICLV)
		if __SZwn is PackedByteArray:
			__lwvG.update(__SZwn)
		elif __SZwn.has_method("get_data"):
			var __k0D2=__SZwn.call("get_data")
			if __k0D2 is PackedByteArray:
				__lwvG.update(__k0D2)
		else:
			__lwvG.update(__SZwn.to_string().to_utf8_buffer())
	else:
		if not FileAccess.file_exists(__ICLV):
			print("SAVE NOT FOUND USING FILEACCESS")
		var __F8IY=FileAccess.open(__ICLV,FileAccess.READ)
		while __F8IY.get_position()<__F8IY.get_length():
			var __iIzX=__F8IY.get_length()-__F8IY.get_position()
			__lwvG.update(__F8IY.get_buffer(min(__iIzX,4096)))
	return __lwvG.finish().hex_encode()
var __YFUD=false
var __Dknt=""
var __GVAR=0.0 
var __fRk1=200
var __Uhqn=0
var __iqDC=0
var __p6vQ=""
var ___mp3=0
var __khLz="V1.5"
var __Ohli
var __4orA=false
func __jkDc():
	var __5ktL={}
	__5ktL["latencyOffset"]=__GVAR
	__5ktL["volumeMaster"]=__fdcb
	__5ktL["volumeMusic"]=__7l9E
	__5ktL["volumeSFX"]=__AFkF
	__5ktL["buttonPromptPlat"]=__HHFV
	var __wXwq=FileAccess.open(__7OLO,FileAccess.WRITE)
	__wXwq.store_string(JSON.stringify(__5ktL,"\t"))
var ___sH9="user://save.save"
var __HHFV=0
var __QXEr=false
var __AFkF=1
func _input(__FQ1N):
	if not __QXEr:
		if __FQ1N is InputEventJoypadButton:
			__J7lQ=1
		elif __FQ1N is InputEventKey:
			__J7lQ=0
var __cR4g=2 
var __B2cY=false
var __ZErl=0
const __6V2r=1024 
func __KaQC(__TIzb):
	if not FileAccess.file_exists(__TIzb):
		return
	var __OgJl=HashingContext.new()
	__OgJl.start(HashingContext.HASH_MD5)
	var __2bxt=FileAccess.open(__TIzb,FileAccess.READ)
	while __2bxt.get_position()<__2bxt.get_length():
		var __ME5F=__2bxt.get_length()-__2bxt.get_position()
		__OgJl.update(__2bxt.get_buffer(min(__ME5F,__6V2r)))
	var __5yxr=__OgJl.finish()
	return __5yxr.hex_encode()
var __zmgV=false
func _process(__sSNr):
	if Input.is_action_just_pressed("FullScreenToggle"):
		__cR4g+=1
		if __cR4g>2:
			__cR4g=0
		if OS.get_name()=="Web" and __cR4g==1:
			__cR4g=2
		__1eNZ()
var __FyRA=0.2 
var __7l9E=1
func __1eNZ():
	match __cR4g:
			0:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
				get_window().set_size(Vector2i(960,540))
				get_window().move_to_center()
			1:
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
				get_window().set_size(Vector2i(1920,1080))
				get_window().move_to_center()
			2:
				get_window().set_size(Vector2i(960,540))
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
func _enter_tree() -> void:
	print("GDMaim - Source map 'Deltarune Lightners Live Plus2025-09-15T16.28.37.gd.map'\n");