extends Node2D
enum State{__6GDt,menu,__5Uuzt,__JCCG,__Ejzd,__Lk1L}
func _process(__p51a):
	__6p6n+=__p51a
	$Cafe/Jukebox/JukeboxExc.position.y=-134+(6*sin(__6p6n*2))
	if $Music.playing==false and not __Pd7h:
		$Music.play()
	__QQp0()
	__bcgO()
	if state==State.__6GDt:
		__MUGI(__p51a)
	elif state==State.menu:
		__kTla(__p51a)
	elif state==State.__5Uuzt:
		__u9Lt(__p51a)
	elif state==State.__JCCG:
		__BT88(__p51a)
	elif state==State.__Ejzd:
		__Ejzd(__p51a)
	elif state==State.__Lk1L:
		__p2um(__p51a)
	if state==State.__6GDt:
		$TouchControls/MobileDisclaimer.visible=true
	else:
		$TouchControls/MobileDisclaimer.visible=false
	__Kru9+=__p51a
	$Cafe/Jukebox/JukeboxGlow.modulate.a=abs(sin(__Kru9*3+0.5))
	$Cafe/LightnersLiveLogo/LogoBloom.self_modulate.a=0.75+abs(sin(__Kru9*0.75+0.5))/4
	if not GlobalVariables.__QXEr:
		if GlobalVariables.__HHFV!=GlobalVariables.__J7lQ:
			GlobalVariables.__HHFV=GlobalVariables.__J7lQ
			__v6Pu()
	if Input.is_action_pressed("ReloadCustomMaps")and __6p6n>3:
		GlobalVariables.__YFUD=true
		GlobalVariables.__W58g.clear()
		GlobalVariables.__cmGH.clear()
		get_tree().reload_current_scene()
	if __ct8W:
		$Cafe/FRIEND.modulate.a=2-(__6p6n*1)
		if __A9DS==false:
			$Cafe/FRIEND/FRIENDLaugh.play()
			__A9DS=true
	queue_redraw()
var __iZA4=[]
func __BSLt():
	GlobalVariables.__WDY2=clamp(GlobalVariables.__WDY2,0,__10QJ.size()-1)
	__HdrB($MenuUI/ScrollContainer/LevelList,GlobalVariables.__WDY2,false)
	$MenuUI/ScrollContainer.ensure_control_visible($MenuUI/ScrollContainer/LevelList.get_child(GlobalVariables.__WDY2))
	if GlobalVariables.__WDY2>0:
		$MenuUI/ScrollContainer.ensure_control_visible($MenuUI/ScrollContainer/LevelList.get_child(GlobalVariables.__WDY2-1))
	if GlobalVariables.__WDY2<__10QJ.size()-1:
		$MenuUI/ScrollContainer.ensure_control_visible($MenuUI/ScrollContainer/LevelList.get_child(GlobalVariables.__WDY2+1))
	$MenuUI/TrackName.text=__10QJ[GlobalVariables.__WDY2].__61x0
	$MenuUI/TrackImage.texture=__10QJ[GlobalVariables.__WDY2].__bR2lS
	___rOA(false)
	$MenuUI/TrackDescription.text=__10QJ[GlobalVariables.__WDY2].description
	$MenuUI/TrackDifficulty.text="Difficulty: "+__10QJ[GlobalVariables.__WDY2].__myfq
	$MenuUI/TrackComposer.text="Composer: "+__10QJ[GlobalVariables.__WDY2].__5CWF
	$MenuUI/TrackHighScore.text="High Score: "+str(int(__10QJ[GlobalVariables.__WDY2].__A6Ai))
	if __10QJ[GlobalVariables.__WDY2].__gGzJ:$MenuUI/OldMapScoreText.visible=true
	else:$MenuUI/OldMapScoreText.visible=false
	$MenuUI/TrackID.text="Map ID: "+__10QJ[GlobalVariables.__WDY2].hash
	if __10QJ[GlobalVariables.__WDY2].__ujTM=="":
		$MenuUI/Switch8Bit.visible=false
		$MenuUI/ButtonPrompts/AlternateMusic.modulate.a=0.2
	else:
		$MenuUI/Switch8Bit.visible=true
		if Input.is_action_just_pressed("Switch8Bit")or __8vuo:
			GlobalVariables.__zmgV=not GlobalVariables.__zmgV
		if not GlobalVariables.__zmgV:
			$MenuUI/Switch8Bit/Default.add_theme_color_override("font_color",Color.YELLOW)
			$MenuUI/Switch8Bit/Default.add_theme_font_size_override("font_size",30)
			$MenuUI/Switch8Bit/Bit.add_theme_color_override("font_color",Color.WHITE)
			$MenuUI/Switch8Bit/Bit.add_theme_font_size_override("font_size",22)
		else:
			$MenuUI/Switch8Bit/Default.add_theme_color_override("font_color",Color.WHITE)
			$MenuUI/Switch8Bit/Default.add_theme_font_size_override("font_size",22)
			$MenuUI/Switch8Bit/Bit.add_theme_color_override("font_color",Color.YELLOW)
			$MenuUI/Switch8Bit/Bit.add_theme_font_size_override("font_size",30)
		$MenuUI/ButtonPrompts/AlternateMusic.modulate.a=1
var __Oz4K=false
func ___0Jw():
	var __l2Ty=$MenuUI/ScrollContainer/LevelList.get_children()
	for __WCX6 in __l2Ty:
		__WCX6.free()
	for __njEX in GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs:
		var __oVTK=Label.new()
		__oVTK.text=__njEX.__61x0.left(27)
		__oVTK.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		__oVTK.custom_minimum_size.y=30 
		__oVTK.add_theme_font_override("font",load("res://Fonts/8bitoperator_jve.ttf"))
		__oVTK.add_theme_font_size_override("font_size",32)
		$MenuUI/ScrollContainer/LevelList.add_child(__oVTK)
	$MenuUI/ScrollContainer.follow_focus=true
func __BT88(__tBjU):
	$CreditsUI.visible=true
	var __TGxW=500
	if Input.is_action_pressed("KDown")or __VyVA:
		$CreditsUI/ScrollContainer.scroll_vertical+=__TGxW*__tBjU
	if Input.is_action_pressed("KUp")or __MG_i:
		$CreditsUI/ScrollContainer.scroll_vertical-=__TGxW*__tBjU
	if Input.is_action_just_pressed("Switch8Bit")or __8vuo:
		OS.shell_open("https://ezioeagle.carrd.co")
	if Input.is_action_just_pressed("Cancel")or __rJPo:
		$CreditsUI.visible=false
		state=State.__6GDt
func __kTla(__Bq99):
	$MenuUI.visible=true
	if Input.is_action_just_pressed("KDown")or __CJEj:
		GlobalVariables.__WDY2+=1
	if Input.is_action_just_pressed("KUp")or __1EEO:
		GlobalVariables.__WDY2-=1
	if Input.is_action_pressed("KDown")or __CJEj:
		__VZQw+=__Bq99
		if __VZQw>0.5:
			__IOL8+=__Bq99
			if __VZQw>2:
				__IOL8+=__Bq99
			if __IOL8>0.1:
				GlobalVariables.__WDY2+=1
				__IOL8=0
	elif Input.is_action_pressed("KUp")or __1EEO:
		__VZQw+=__Bq99
		if __VZQw>0.5:
			__IOL8+=__Bq99
			if __VZQw>2:
				__IOL8+=__Bq99
			if __IOL8>0.1:
				GlobalVariables.__WDY2-=1
				__IOL8=0
	else:
		__VZQw=0
		__IOL8=0
	if Input.is_action_just_pressed("TabLeft")or __Vksv:
		GlobalVariables.__APE8-=1
		GlobalVariables.__WDY2=0
		__tfwO()
	if Input.is_action_just_pressed("TabRight")or __50rj:
		GlobalVariables.__APE8+=1
		GlobalVariables.__WDY2=0
		__tfwO()
		$MenuUI/ButtonPrompts/TabArrowR.visible=false
	$MenuUI/ButtonPrompts/TabArrowR.modulate.a=remap(sin(__6p6n*8),-1,1,0.1,1)
	__GWmB()
	if Input.is_action_just_pressed("Confirm")or __XZRz:
		if __Jw4q:print("loading level")
		__AeQh(false)
	if Input.is_action_just_pressed("Cancel")or __rJPo:
		$MenuUI.visible=false
		state=State.__6GDt
var __EeEl=false
var __qeFP=0.0
func __clyr():
	var __8CBZ=$SettingsUI/SelectableOptions
	var __Aivz="Latency Offset: "
	if $SettingsUI/SelectableOptions/LatencyBar.value>0:
		__Aivz+="+"
	$SettingsUI/SelectableOptions/LatencyBar/LatencyText.text=__Aivz+str(int($SettingsUI/SelectableOptions/LatencyBar.value))
	GlobalVariables.__GVAR=$SettingsUI/SelectableOptions/LatencyBar.value
	$SettingsUI/SelectableOptions/VolumeMasterBar/VolumeMasterText.text="Master Volume: "+str(int($SettingsUI/SelectableOptions/VolumeMasterBar.value*100))+"%"
	GlobalVariables.__fdcb=$SettingsUI/SelectableOptions/VolumeMasterBar.value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),linear_to_db(GlobalVariables.__fdcb))
	$SettingsUI/SelectableOptions/VolumeMusicBar/VolumeMusicText.text="Music Volume: "+str(int($SettingsUI/SelectableOptions/VolumeMusicBar.value*100))+"%"
	GlobalVariables.__7l9E=$SettingsUI/SelectableOptions/VolumeMusicBar.value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),linear_to_db(GlobalVariables.__7l9E))
	$SettingsUI/SelectableOptions/VolumeSFXBar/VolumeSFXText.text="SFX Volume: "+str(int($SettingsUI/SelectableOptions/VolumeSFXBar.value*100))+"%"
	GlobalVariables.__AFkF=$SettingsUI/SelectableOptions/VolumeSFXBar.value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),linear_to_db(GlobalVariables.__AFkF))
func __MYUy(__N5YB):
	var __ufXN={}
	if FileAccess.file_exists(GlobalVariables.___sH9):
		var __nMcb=FileAccess.open(GlobalVariables.___sH9,FileAccess.READ)
		__ufXN=JSON.parse_string(__nMcb.get_as_text())
		if __ufXN==null:
			__ufXN={}
	var __jAZf
	if __N5YB:
		__jAZf=ResourceLoader.list_directory(GlobalVariables.__yAnJ)
	else:
		__jAZf=DirAccess.get_files_at(GlobalVariables.__ONPS)
	for __6dx3 in __jAZf:
		var __Z1iQ=load("res://MapPack.gd").new()
		__Z1iQ.__SXc7=__6dx3.left(-1)
		var __shhd=GlobalVariables.__yAnJ+__6dx3
		var __puQO
		__puQO=ResourceLoader.list_directory(__shhd)
		for __WcMF in __puQO:
			if __WcMF=="." or __WcMF=="..":
				continue
			var __0H54=__shhd+__WcMF
			var __wOHC=load("res://Map.gd").new()
			__wOHC.__61x0=__WcMF.left(-1)
			var __VLfI=ResourceLoader.list_directory(__0H54)
			if __wOHC.__61x0=="Dig! Dig! To The Center of the Earth!/":
				var __ZoMk=1
			var __zAjX=__0H54+__WcMF.left(-1)+".txt"
			if FileAccess.file_exists(__zAjX):
				var __x2J6=__sLCa(__zAjX)
				__wOHC.__myfq=__x2J6["difficulty"]
				__wOHC.description=__x2J6["description"]
				__wOHC.__5CWF=__x2J6["composer"]
				__wOHC.volume=__x2J6["volume"]
				__wOHC.__VbTT=__x2J6["alt volume"]
				__wOHC.__csr0=__x2J6["order"]
				__wOHC.__TS5O=__x2J6["inheritscorefromid"]
				__wOHC.__ar07=__x2J6["colorkrisl"]
				__wOHC.__bKHS=__x2J6["colorkrisr"]
				__wOHC.__QMrL=__x2J6["colorkrisbox"]
				if __Jw4q:print("Loaded txt for ",__WcMF.left(-1))
			for __s4JP in __VLfI:
				var __xSCL=__0H54+__s4JP
				if __s4JP.ends_with(".png")or __s4JP.ends_with(".jpg")or __s4JP.ends_with(".jpeg"):
					if __wOHC.__bR2lS==null:
						if ResourceLoader.exists(__xSCL):
							__wOHC.__bR2lS=ResourceLoader.load(__xSCL)
							if __Jw4q:print("Loaded image for ",__WcMF.left(-1))
				if __s4JP.ends_with(".wav")or __s4JP.ends_with(".mp3")or __s4JP.ends_with(".ogg"):
					if __s4JP.to_lower().contains("8 bit"):
						__wOHC.__ujTM=__xSCL
					else:
						__wOHC.__Dknt=__xSCL
					if __Jw4q:print("Loaded music for ",__WcMF.left(-1))
				if __s4JP.ends_with(".mid"):
					__wOHC.__7ZAV=__xSCL
					var __cR2y=ResourceLoader.load(__wOHC.__7ZAV)
					var __u3KG=__wOHC.__7ZAV.split("/")
					var __LwrV=str(__u3KG[-1])
					var __kSf1=__LwrV.left(-4)
					__wOHC.hash=GlobalVariables.__5Kpd(__cR2y)
					if not __ufXN.has(__kSf1):
						__ufXN[__kSf1]={}
					var __ms4x=__ufXN[__kSf1]
					if __ms4x.has(__wOHC.hash):
						__wOHC.__A6Ai=float(__ms4x[__wOHC.hash])
					if __wOHC.__TS5O!="":
						if __ms4x.has(__wOHC.__TS5O):
							if float(__ms4x[__wOHC.__TS5O])>__wOHC.__A6Ai:
								__wOHC.__A6Ai=float(__ms4x[__wOHC.__TS5O])
								__wOHC.__gGzJ=true
					for __ZuE8 in __cR2y.tracks:
						if __ZuE8.name.to_lower()=="susie":
							__wOHC.__NwuX=true
						if __ZuE8.name.to_lower()=="ralsei":
							__wOHC.__vvg1=true
					if __Jw4q:print("Loaded midi for ",__WcMF.left(-1))
			__10QJ.push_back(__wOHC)
			__Z1iQ.__Okfs.push_back(__wOHC)
			if __wOHC.__bR2lS==null:
				if __Jw4q:printerr("image == null for ",__WcMF.left(-1))
			if __wOHC.__Dknt=="":
				if __Jw4q:printerr("musicName == \"\" for ",__WcMF.left(-1))
			if __wOHC.description=="":
				if __Jw4q:printerr("description == \"\" for ",__WcMF.left(-1))
		GlobalVariables.__W58g.push_back(__Z1iQ)
	__10QJ.sort_custom(__Wcdg)
	for __dL5e in GlobalVariables.__W58g:
		__dL5e.__Okfs.sort_custom(__Wcdg)
	if __Jw4q:print("Levels found (Internal): ",__10QJ)
func __sLCa(__nQu6:String)->Dictionary:
	var __nEY1={
		"difficulty":"unknown",
		"description":"",
		"composer":"unknown",
		"volume":0,
		"alt volume":0,
		"order":null,
		"inheritscorefromid":"",
		"colorkrisl":"",
		"colorkrisr":"",
		"colorkrisbox":""
	}
	if not FileAccess.file_exists(__nQu6):
		return __nEY1
	var __2rQT=FileAccess.open(__nQu6,FileAccess.READ)
	while not __2rQT.eof_reached():
		var __QlZ6=__2rQT.get_line().strip_edges()
		if __QlZ6=="" or __QlZ6.begins_with("#"):
			continue
		var __Ysl3=__QlZ6.split(":",false,2)
		if __Ysl3.size()==2:
			var __YLWa=__Ysl3[0].strip_edges().to_lower()
			var ___MJL=__Ysl3[1].strip_edges()
			if __nEY1.has(__YLWa):
				__nEY1[__YLWa]=___MJL
	return __nEY1
func __BcXG(__qo2u,__VBAY):
	var __kKd5=__x3gA-__VBAY
	if __PHFH.size()<3:
		return __PHFH[0]["pos"]
	for __LytD in range(__PHFH.size()-1):
		var __kmTP=__PHFH[__LytD]["time"]
		var __ISBM=__PHFH[__LytD+1]["time"]
		if __kmTP<=__kKd5 and __ISBM>=__kKd5:
			var __QmWS=__PHFH[__LytD]["pos"]
			var __G4XV=__PHFH[__LytD+1]["pos"]
			var __g2L_=(__kKd5-__kmTP)/(__ISBM-__kmTP)
			__qo2u.position=__QmWS.lerp(__G4XV,__g2L_)
			__qo2u.animation=__PHFH[__LytD]["anim"]
			__qo2u.frame=__PHFH[__LytD]["frame"]
			if __LytD>1:
				if __PHFH[__LytD]["pos"]==__PHFH[__LytD-1]["pos"]:
					__qo2u.frame=1
			break
		__qo2u.position=__PHFH[0]["pos"]
var __x3gA=0
var __8vuo=false
func __C1D1():
	GlobalVariables.__ONPS=OS.get_executable_path().get_base_dir()+"/Custom Maps"
	var __IYQY={}
	if FileAccess.file_exists(GlobalVariables.___sH9):
		var __tARs=FileAccess.open(GlobalVariables.___sH9,FileAccess.READ)
		__IYQY=JSON.parse_string(__tARs.get_as_text())
		if __IYQY==null:
			__IYQY={}
	var __t11C
	var __IDuo=load("res://MapPack.gd").new()
	__IDuo.__SXc7="Unsorted Custom Maps"
	var __zWcF=DirAccess.open(GlobalVariables.__ONPS)
	if __zWcF:
		__zWcF.list_dir_begin()
		var __5rQx=__zWcF.get_next()
		while __5rQx!="":
			if __zWcF.current_is_dir():
				var __Po_0=load("res://MapPack.gd").new()
				__Po_0.__SXc7=__5rQx
				var __80fP=GlobalVariables.__ONPS+"/"+__5rQx
				var __PZPW=DirAccess.open(__80fP)
				if __PZPW:
					__PZPW.list_dir_begin()
					var __NKJp=__PZPW.get_next()
					if not __PZPW.current_is_dir():
						var __0zjf=GlobalVariables.__ONPS+"/"+__NKJp.get_basename()
						var __oJac=__OCdF(__0zjf,__IYQY)
						if __oJac!=null:__IDuo.__Okfs.push_back(__oJac)
						__5rQx=__zWcF.get_next()
						continue
					while __NKJp!="":
						if __PZPW.current_is_dir:
							var __6iP_=__80fP+"/"+__NKJp
							var __lAWq=__OCdF(__6iP_,__IYQY)
							if __lAWq!=null:__Po_0.__Okfs.push_back(__lAWq)
							__NKJp=__PZPW.get_next()
					if __Po_0.__Okfs.size()>0:
						GlobalVariables.__cmGH.push_back(__Po_0)
			else:
				print("Found file: "+__5rQx+" (ERROR: found file inside custom maps, should be just folders of all the maps)")
			__5rQx=__zWcF.get_next()
	else:
		print("An error occurred when trying to access the path.")
	if __IDuo.__Okfs.size()>0:
		GlobalVariables.__cmGH.push_front(__IDuo)
	for __GJh5 in GlobalVariables.__cmGH:
		__GJh5.__Okfs.sort_custom(__Wcdg)
	var __9xO4=1
func __Wcdg(__hCpl,__PTBSIM):
	if __hCpl.__csr0==null:
		return false
	if __PTBSIM.__csr0==null:
		return true
	if float(__hCpl.__csr0)<float(__PTBSIM.__csr0):
		return true
	return false
func _ready():
	$MenuUI.visible=false
	$SettingsUI.visible=false
	$CreditsUI.visible=false
	$PCUI.visible=false
	$FirstTimeMessage.visible=false
	$Cafe/Jukebox/JukeboxExc.visible=false
	$Cafe/FRIEND.visible=false
	GlobalVariables.__4orA=false
	$Cafe/YSort/Kris/Sprite.set_animation("Up")
	$Cafe/YSort/Susie.position=$Cafe/YSort/Kris.position
	$Cafe/YSort/Ralsei.position=$Cafe/YSort/Kris.position
	__Ej57=$Cafe/YSort/Kris.z_index
	if GlobalVariables.__3JzN==true:
		$Cafe/YSort/Kris.position=$Cafe/Jukebox.position+Vector2(-2,24)
		$Cafe/YSort/Susie.position=$Cafe/YSort/Kris.position+Vector2(0,16)
		$Cafe/YSort/Ralsei.position=$Cafe/YSort/Kris.position+Vector2(0,32)
		GlobalVariables.__3JzN=false
	if GlobalVariables.__YFUD==true:
		$Cafe/YSort/Kris.position=$Cafe/PC.position+Vector2(66,0)
		$Cafe/YSort/Susie.position=$Cafe/YSort/Kris.position+Vector2(8,-4)
		$Cafe/YSort/Ralsei.position=$Cafe/YSort/Kris.position+Vector2(16,-4)
		$Cafe/YSort/Kris/Sprite.set_animation("Left")
		$Cafe/YSort/Susie.set_animation("Left")
		$Cafe/YSort/Ralsei.set_animation("Left")
		GlobalVariables.__YFUD=false
	$SettingsUI/VersionNumber.text=GlobalVariables.__khLz
	if GlobalVariables.__s9m7==false:$MenuUI/ButtonPrompts/TabArrowR.visible=false
	$Cafe/PC.visible=true
	$Cafe/PC/StaticBody2D/CollisionShape2D.disabled=false
	if OS.get_name()=="Web" or OS.get_name()=="Android":
		$CreditsUI/ScrollContainer/VBoxContainer/Label/PCorWebChange.text="Speak to Swatch to change settings, and select a map using the Jukebox."
	if OS.has_feature("web_android")or OS.has_feature("web_ios")or OS.get_name()=="Android":
		$TouchControls.visible=true
		Engine.max_fps=60
	else:
		$TouchControls.visible=false
	if not FileAccess.file_exists(GlobalVariables.__7OLO):
		state=State.__Lk1L
		$Cafe/Jukebox/JukeboxExc.visible=true
	__T0T8=RandomNumberGenerator.new()
	if __T0T8.randi_range(1,1000)==101:
		__ct8W=true
		$Cafe/FRIEND.visible=true
	if __T0T8.randi_range(1,5)==1:
		$Cafe/Performers/Tenna.visible=true
		$Cafe/Performers/Sweet.visible=false
	else:
		$Cafe/Performers/Tenna.visible=false
		$Cafe/Performers/Sweet.visible=true
	__taLX()
	if GlobalVariables.__W58g.size()==0:__MYUy(true)
	___0Jw()
	__krDy()
	__v6Pu()
	__tfwO()
	$Music.play()
	if OS.get_name()=="Web":
		$PCUI/CustomsMenu.visible=false
		$PCUI/WebMessage.visible=true
	else:
		$PCUI/CustomsMenu.visible=true
		$PCUI/WebMessage.visible=false
		if GlobalVariables.__cmGH.size()==0:__C1D1()
		__pOnt()
		__kx99()
	GlobalVariables.__py0z()
func __qBxo()->void:
	pass
var __Ej57=0
func __Zp_c():
	pass
var __ct8W=false
func __cYjn():
	var __DMB0={}
	if FileAccess.file_exists(GlobalVariables.__7OLO):
		var __8hNr=FileAccess.open(GlobalVariables.__7OLO,FileAccess.READ)
		__DMB0=JSON.parse_string(__8hNr.get_as_text())
		if __DMB0==null:
			__DMB0={}
		if __DMB0.has("latencyOffset"):GlobalVariables.__GVAR=__DMB0["latencyOffset"]
		if __DMB0.has("volumeMaster"):GlobalVariables.__fdcb=__DMB0["volumeMaster"]
		if __DMB0.has("volumeMusic"):GlobalVariables.__7l9E=__DMB0["volumeMusic"]
		if __DMB0.has("volumeSFX"):GlobalVariables.__AFkF=__DMB0["volumeSFX"]
		if __DMB0.has("buttonPromptPlat"):GlobalVariables.__HHFV=__DMB0["buttonPromptPlat"]
		else:GlobalVariables.__HHFV=0
	else:GlobalVariables.__fdcb=0.5
var __0nrG=1
func ___rOA(__0FfP):
	if __0FfP:
		if $PCUI/CustomsMenu/TrackImage.texture==null:
			return
		var __Gyvg=$PCUI/CustomsMenu/TrackImage.texture.get_size()
		if __Gyvg.x==0 or __Gyvg.y==0:
			return
		var __U_vP=__vcuG.y/__Gyvg.y
		$PCUI/CustomsMenu/TrackImage.scale=Vector2(__U_vP,__U_vP)
	else:
		if $MenuUI/TrackImage.texture==null:
			return
		var __AhOt=$MenuUI/TrackImage.texture.get_size()
		if __AhOt.x==0 or __AhOt.y==0:
			return
		var __OLoq=__vcuG.y/__AhOt.y
		$MenuUI/TrackImage.scale=Vector2(__OLoq,__OLoq)
var __2By5=false
var __rJPo=false
var __I8cM=false
var __Kru9=0
var __IOL8=0.0
func __6gW1(__fhVo:int)->void:
	GlobalVariables.__QXEr=true
	GlobalVariables.__HHFV=__fhVo
	__v6Pu()
var __nvzD=true
var __XZRz=false
func __p2um(__Azuv):
	$FirstTimeMessage.visible=true
	if Input.is_action_just_pressed("Cancel")or __rJPo:
		$FirstTimeMessage.visible=false
		state=State.__6GDt
var __vcuG=Vector2(150,150)
func __OCdF(__L6BA,__z6ie):
	var __KZHC=load("res://Map.gd").new()
	var __kvqs=__L6BA.get_file().get_basename()
	__KZHC.__61x0=__kvqs
	__KZHC.__W6VkJ=true
	var __O7P3=DirAccess.open(__L6BA)
	if __O7P3:
		__O7P3.list_dir_begin()
		var __32Qo=__O7P3.get_next()
		while __32Qo!="":
			if __O7P3.current_is_dir():
				print("Found directory: "+__32Qo+" (ERROR: found directory inside map folder)")
			else:
				var __0cab=__L6BA+"/"+__32Qo 
				if __0cab.ends_with(".txt"):
					var __QICk=__sLCa(__0cab)
					__KZHC.__myfq=__QICk["difficulty"]
					__KZHC.description=__QICk["description"]
					__KZHC.__5CWF=__QICk["composer"]
					__KZHC.volume=__QICk["volume"]
					__KZHC.__VbTT=__QICk["alt volume"]
					__KZHC.__csr0=__QICk["order"]
					__KZHC.__TS5O=__QICk["inheritscorefromid"]
					__KZHC.__ar07=__QICk["colorkrisl"]
					__KZHC.__bKHS=__QICk["colorkrisr"]
					__KZHC.__QMrL=__QICk["colorkrisbox"]
				elif __0cab.ends_with(".png")or __0cab.ends_with(".jpg")or __0cab.ends_with(".jpeg"):
					if __KZHC.__bR2lS==null:
						var __m2Wv=Image.new()
						var __36FY=__m2Wv.load(__0cab)
						if __36FY!=OK:
							print("failed to load image from: ",__0cab)
						__KZHC.__bR2lS=ImageTexture.create_from_image(__m2Wv)
						var __Z9EW=ImageTexture.new()
						__Z9EW.set_image(__m2Wv)
				elif __0cab.ends_with(".wav")or __0cab.ends_with(".mp3")or __0cab.ends_with(".ogg"):
					if __0cab.to_lower().contains("8 bit"):
						pass 
					else:
						__KZHC.__Dknt=__0cab
				elif __0cab.ends_with(".mid"):
					__KZHC.__7ZAV=__0cab
					var ___MbY=__KZHC.__7ZAV.split("/")
					var __7Tso=str(___MbY[-1])
					var __d53i=__7Tso.left(-4)
					var __1WU6=MidiResource.new()
					__1WU6.load_file(__KZHC.__7ZAV)
					__KZHC.hash=GlobalVariables.__5Kpd(__1WU6)
					if not __z6ie.has(__d53i):
						__z6ie[__d53i]={}
					var __5unX=__z6ie[__d53i]
					if __5unX.has(__KZHC.hash):
						__KZHC.__A6Ai=float(__5unX[__KZHC.hash])
					if __KZHC.__TS5O!="":
						if __5unX.has(__KZHC.__TS5O):
							if float(__5unX[__KZHC.__TS5O])>__KZHC.__A6Ai:
								__KZHC.__A6Ai=float(__5unX[__KZHC.__TS5O])
								__KZHC.__gGzJ=true
			__32Qo=__O7P3.get_next()
		return __KZHC
	else:
		print("An error occurred when trying to access the path.")
func __taLX():
	GlobalVariables.__Dknt=""
	GlobalVariables.__7ZAV=""
var __2sgr=false
var __V1bA=2.0
var __pcP_=false
var __mcwl=0
var __HJZx=false
var __Vksv=false
func __hgzi(__MkuA):
	$Cafe/YSort/Kris/Sprite.set_animation(__MkuA)
	___VhP=true
	$Cafe/YSort/Kris/Sprite.frame=__flA_
	$Cafe/YSort/Kris/Sprite.frame_progress=__mcwl
func __mTeI():
	var __ceOP={}
	if FileAccess.file_exists(GlobalVariables.___sH9):
		var __qVKA=FileAccess.open(GlobalVariables.___sH9,FileAccess.READ)
		__ceOP=JSON.parse_string(__qVKA.get_as_text())
		if __ceOP==null:
			__ceOP={}
	var __v0CT=DirAccess.open("res://Charts")
	if __v0CT:
		__v0CT.list_dir_begin()
		var __4MK6=__v0CT.get_next()
		while __4MK6!="":
			if __v0CT.current_is_dir()and __4MK6!="." and __4MK6!="..":
				var __8EN3="res://Charts/"+__4MK6+"/"
				var __JrQF=load("res://Map.gd").new()
				__JrQF.__61x0=__4MK6
				if __Jw4q:print(__JrQF)
				if __Jw4q:print("entry: "+__4MK6)
				var __XcU6=DirAccess.open(__8EN3)
				if __XcU6:
					__XcU6.list_dir_begin()
					var __T04F=__XcU6.get_next()
					while __T04F!="":
						if not __XcU6.current_is_dir():
							if __T04F.ends_with(".txt"):
								var __uuju=__sLCa(__8EN3+__T04F)
								__JrQF.__myfq=__uuju["difficulty"]
								__JrQF.description=__uuju["description"]
								__JrQF.__5CWF=__uuju["composer"]
								__JrQF.volume=__uuju["volume"]
								__JrQF.__csr0=__uuju["order"]
								if __Jw4q:print("found txt")
							if __T04F.ends_with(".png")or __T04F.ends_with(".jpg")or __T04F.ends_with(".jpeg"):
								if __JrQF.__bR2lS==null:
									__JrQF.__bR2lS=load(__8EN3+__T04F)
									if __Jw4q:print("found image")
							if __T04F.ends_with(".wav")or __T04F.ends_with(".mp3")or __T04F.ends_with(".ogg"):
								if __T04F.contains("8 bit")or __T04F.contains("8 Bit"):
									__JrQF.__ujTM=(__8EN3+__T04F)
								else:
									__JrQF.__Dknt=(__8EN3+__T04F)
								if __Jw4q:print("found music")
							if __T04F.ends_with(".mid"):
								__JrQF.__7ZAV=__8EN3+__T04F
								__JrQF.hash=GlobalVariables.__y64g(__8EN3+__T04F)
								if __Jw4q:print("found midi")
							if not __ceOP.has(__4MK6):
								__ceOP[__4MK6]={}
							var __INZu=__ceOP[__4MK6]
							if __INZu.has(__JrQF.hash):
								__JrQF.__A6Ai=float(__INZu[__JrQF.hash])
						__T04F=__XcU6.get_next()
					__XcU6.list_dir_end()
				__10QJ.push_back(__JrQF)
				if __JrQF.__bR2lS==null:
					if __Jw4q:printerr("image == null")
				if __JrQF.__61x0=="":
					if __Jw4q:printerr("mapName == \"\"")
				if __JrQF.__Dknt=="":
					if __Jw4q:printerr("musicName == \"\"")
				if __JrQF.description=="":
					if __Jw4q:printerr("description == \"\"")
			__4MK6=__v0CT.get_next()
		__v0CT.list_dir_end()
	else:print("Failed to open Charts folder!")
	print("Levels found: ",__10QJ)
	__10QJ.sort_custom(__Wcdg)
var __jI1d=false
var __A9DS=false
var __1EEO=false
var __T0T8
var __MG_i=false
var __APE8=0
var __iJdv=4
var state=State.__6GDt 
var ___VhP=false
func __bcgO():
	if Input.is_action_just_pressed("Esc"):
		$QuitMessage.play()
	if not Input.is_action_pressed("Esc"):
		$QuitMessage.stop()
		$QuitMessage.visible=false
	else:
		$QuitMessage.visible=true
	if $QuitMessage.frame==4:
		get_tree().quit()
func __sYJd(__fAhW):
	var __fMcS=__fAhW.global_position-(Vector2((__fAhW.get_texture().get_width()*0.5)*__fAhW.scale.x,(__fAhW.get_texture().get_height()*0.5)*__fAhW.scale.y))
	var __F3cQ=Vector2(__fAhW.get_texture().get_width()*__fAhW.scale.x,__fAhW.get_texture().get_height()*__fAhW.scale.y)
	var __eZjo=Vector2(__iJdv*0.5,0)
	var __ztmm=__fMcS+Vector2(__F3cQ.x,0)
	var __Z2jz=__fMcS+Vector2(0,__F3cQ.y)
	var __BGqY=__fMcS+Vector2(__F3cQ.x,__F3cQ.y)
	draw_line(__fMcS-__eZjo,__ztmm+__eZjo,Color.WHITE,__iJdv)
	draw_line(__Z2jz-__eZjo,__BGqY+__eZjo,Color.WHITE,__iJdv)
	draw_line(__fMcS,__Z2jz,Color.WHITE,__iJdv)
	draw_line(__ztmm,__BGqY,Color.WHITE,__iJdv)
var __50rj=false
var __roTV=false
var __CJEj=false
var __flA_=0
var __fRk1=200
func __AeQh(__ywof):
	if __ywof:
		GlobalVariables.__Ohli=GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3]
		GlobalVariables.__61x0=GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].__61x0
		GlobalVariables.__Dknt=GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].__Dknt
		GlobalVariables.__7ZAV=GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].__7ZAV
		GlobalVariables.__Uhqn=GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].volume
		GlobalVariables.__7Rpg=GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].hash
		if GlobalVariables.__zmgV and GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].__ujTM!=null and GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].__ujTM!="":
			GlobalVariables.__Dknt=GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].__ujTM
			GlobalVariables.__Uhqn=GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].__VbTT
		GlobalVariables.__NnDK=true
		GlobalVariables.__YFUD=true
	else:
		GlobalVariables.__Ohli=GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2]
		GlobalVariables.__61x0=GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__61x0
		GlobalVariables.__Dknt=GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__Dknt
		GlobalVariables.__7ZAV=GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__7ZAV
		GlobalVariables.__Uhqn=GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].volume
		GlobalVariables.__7Rpg=GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].hash
		if GlobalVariables.__zmgV and GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__ujTM!=null and GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__ujTM!="":
			GlobalVariables.__Dknt=GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__ujTM
			GlobalVariables.__Uhqn=GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__VbTT
		GlobalVariables.__NnDK=false
		GlobalVariables.__3JzN=true
	__Pd7h=true
	$Music.stop()
	await get_tree().create_timer(0.1).timeout
	GlobalVariables.__s9m7=false
	var __R7mQ=load("res://main.tscn")
	get_tree().change_scene_to_packed(__R7mQ)
func __Ivin():
	for __6nYK in __10QJ:
		var __5EWy=Label.new()
		__5EWy.text=__6nYK.__61x0.left(27)
		__5EWy.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		__5EWy.custom_minimum_size.y=30 
		__5EWy.add_theme_font_override("font",load("res://Fonts/8bitoperator_jve.ttf"))
		__5EWy.add_theme_font_size_override("font_size",32)
		$MenuUI/ScrollContainer/LevelList.add_child(__5EWy)
	$MenuUI/ScrollContainer.follow_focus=true
func __kx99():
	if GlobalVariables.__cmGH.is_empty():
		return

	GlobalVariables.__INba=clamp(GlobalVariables.__INba,0,GlobalVariables.__cmGH.size()-1)
	$PCUI/CustomsMenu/Tabs/CurrentMapPack.text=GlobalVariables.__cmGH[GlobalVariables.__INba].__SXc7
	if GlobalVariables.__INba>0:$PCUI/CustomsMenu/Tabs/PreviousMapPack.text=GlobalVariables.__cmGH[GlobalVariables.__INba-1].__SXc7
	else:$PCUI/CustomsMenu/Tabs/PreviousMapPack.text=""
	if GlobalVariables.__INba<GlobalVariables.__cmGH.size()-1:$PCUI/CustomsMenu/Tabs/NextMapPack.text=GlobalVariables.__cmGH[GlobalVariables.__INba+1].__SXc7
	else:$PCUI/CustomsMenu/Tabs/NextMapPack.text=""
	__pOnt()
var __qNK_=false
func __pOnt():
	if GlobalVariables.__cmGH.is_empty():
		return

	var __j2cf=$PCUI/CustomsMenu/ScrollContainer/LevelList.get_children()
	for __9yYs in __j2cf:
		__9yYs.free()
	for __fKN2 in GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs:
		var __KzWG=Label.new()
		__KzWG.text=__fKN2.__61x0.left(27)
		__KzWG.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		__KzWG.custom_minimum_size.y=30 
		__KzWG.add_theme_font_override("font",load("res://Fonts/8bitoperator_jve.ttf"))
		__KzWG.add_theme_font_size_override("font_size",32)
		$PCUI/CustomsMenu/ScrollContainer/LevelList.add_child(__KzWG)
	$PCUI/CustomsMenu/ScrollContainer.follow_focus=true
	for __Vhwj in __iZA4:
		var ___3Ai=Label.new()
		___3Ai.text=__Vhwj.__61x0
		___3Ai.size_flags_horizontal=Control.SIZE_EXPAND_FILL
		___3Ai.custom_minimum_size.y=30 
		___3Ai.add_theme_font_override("font",load("res://Fonts/8bitoperator_jve.ttf"))
		___3Ai.add_theme_font_size_override("font_size",32)
		$PCUI/CustomsMenu/ScrollContainer/LevelList.add_child(___3Ai)
	$PCUI/CustomsMenu/ScrollContainer.follow_focus=true
var __EK22=false
func __MUGI(__zeEP):
	___VhP=false
	__flA_=$Cafe/YSort/Kris/Sprite.frame
	__mcwl=$Cafe/YSort/Kris/Sprite.frame_progress
	$Cafe/YSort/Kris.velocity=Vector2(0,0)
	var __BFXV=__fRk1
	var __1nB4=1
	var __5RYI=Vector2(0,0)
	if Input.is_action_pressed("Cancel")or __qNK_:
		__qeFP+=__zeEP
	else:
		__qeFP=0
	if __qeFP>2:__1nB4=1.8
	elif __qeFP>0.33:__1nB4=1.6
	elif __qeFP>0:__1nB4=1.4
	__BFXV=__fRk1*__1nB4
	$Cafe/YSort/Kris/Sprite.speed_scale=__1nB4
	if Input.is_action_pressed("KUp")or __MG_i:
		$Cafe/YSort/Kris.velocity.y=-__BFXV
		__5RYI.y+=-1
		__hgzi("Up")
	if Input.is_action_pressed("KDown")or __VyVA:
		$Cafe/YSort/Kris.velocity.y=__BFXV
		__5RYI.y+=1
		__hgzi("Down")
	if Input.is_action_pressed("KLeft")or __jI1d:
		$Cafe/YSort/Kris.velocity.x=-__BFXV
		__5RYI.x+=-1
		__hgzi("Left")
	if Input.is_action_pressed("KRight")or __4RxL:
		$Cafe/YSort/Kris.velocity.x+=__BFXV
		__5RYI.x+=1
		__hgzi("Right")
	$Cafe/YSort/Kris.velocity=__5RYI*__BFXV
	if __I8cM==false:
		$Cafe/YSort/Kris/Sprite.frame=0
	$Cafe/YSort/Kris.move_and_slide()
	if Input.is_action_just_pressed("Confirm")or __pcP_:
		if $Cafe/YSort/Kris.position.distance_to($Cafe/Jukebox.position)<60:
			if 1==1:
				___VhP=false
				state=State.menu
		elif $Cafe/YSort/Kris.position.distance_to($Cafe/Swatch.position)<100:
			if 1==1:
				___VhP=false
				state=State.__5Uuzt
		elif $Cafe/YSort/Kris.position.distance_to($Cafe/PC.position)<100 and $Cafe/PC.visible:
			if 1==1:
				___VhP=false
				state=State.__Ejzd
		elif $Cafe/YSort/Kris.position.distance_to($Cafe/Swatchling.position)<100 and $Cafe/Swatchling.visible:
			if 1==1:
				___VhP=false
				state=State.__JCCG
	if ___VhP:
		$Cafe/YSort/Kris/Sprite.play()
		__I8cM=true
		__mNz7(__zeEP)
	else:
		$Cafe/YSort/Kris/Sprite.pause()
		$Cafe/YSort/Kris/Sprite.frame=1
		$Cafe/YSort/Susie.frame=1
		$Cafe/YSort/Ralsei.frame=1
		__I8cM=false
var __mCEV 
var __VyVA=false
var __93DX=false
func __krDy():
	__cYjn()
	$SettingsUI/SelectableOptions/LatencyBar.value=GlobalVariables.__GVAR
	$SettingsUI/SelectableOptions/VolumeMasterBar.value=GlobalVariables.__fdcb
	$SettingsUI/SelectableOptions/VolumeMusicBar.value=GlobalVariables.__7l9E
	$SettingsUI/SelectableOptions/VolumeSFXBar.value=GlobalVariables.__AFkF
	__clyr()
func __v6Pu():
	var __Vz4W="res://Sprites/ButtonPromps/"
	GlobalVariables.__HHFV=int(GlobalVariables.__HHFV)
	match GlobalVariables.__HHFV:
		0:
			__Vz4W+="Keyboard"
		1:
			__Vz4W+="Xbox"
		2:
			__Vz4W+="PS"
	$SettingsUI/ButtonPrompts/CloseMenu/CloseMenuButton.texture=load(__Vz4W+"/Cancel.png")
	$SettingsUI/ButtonPrompts/LatencyOffsetMap/LatencyOffsetMapButton.texture=load(__Vz4W+"/Menu.png")
	$MenuUI/ButtonPrompts/PlayMap/PlayMapButton.texture=load(__Vz4W+"/Select.png")
	$MenuUI/ButtonPrompts/CloseMenu/CloseMenuButton.texture=load(__Vz4W+"/Cancel.png")
	$MenuUI/ButtonPrompts/AlternateMusic/AlternateMusicButton.texture=load(__Vz4W+"/Menu.png")
	$CreditsUI/ButtonPrompts/Links/LinksButton.texture=load(__Vz4W+"/Menu.png")
	$CreditsUI/ButtonPrompts/CloseMenu/CloseMenuButton.texture=load(__Vz4W+"/Cancel.png")
	$PCUI/CustomsMenu/ButtonPrompts/PlayMap/PlayMapButton.texture=load(__Vz4W+"/Select.png")
	$PCUI/CustomsMenu/ButtonPrompts/CloseMenu/CloseMenuButton.texture=load(__Vz4W+"/Cancel.png")
	$PCUI/CustomsMenu/ButtonPrompts/AlternateMusic/AlternateMusicButton.texture=load(__Vz4W+"/Menu.png")
	$FirstTimeMessage/CloseButton.texture=load(__Vz4W+"/Cancel.png")
func __mNz7(__GmSx):
	__x3gA+=__GmSx
	__PHFH.push_back({"pos":$Cafe/YSort/Kris.position,"time":__x3gA,"anim":$Cafe/YSort/Kris/Sprite.animation,"frame":$Cafe/YSort/Kris/Sprite.frame})
	while __PHFH.size()>1 and __PHFH[0]["time"]<__x3gA-__V1bA:
		__PHFH.pop_front()
	__BcXG($Cafe/YSort/Susie,0.33)
	$Cafe/YSort/Susie.position.y-=6
	__BcXG($Cafe/YSort/Ralsei,0.7)
	$Cafe/YSort/Susie.position.y-=2
	$Cafe/YSort/Ralsei.position.y-=4
func __HdrB(__r9hB,__RIvQ,__1EQq):
	for __M0c8 in range(__r9hB.get_child_count()):
		var __Mm9c=__r9hB.get_child(__M0c8)
		if __1EQq:__Mm9c=__r9hB.get_child(__M0c8).get_child(0)
		if __M0c8==__RIvQ:
			__Mm9c.add_theme_color_override("font_color",Color.YELLOW)
		else:
			__Mm9c.add_theme_color_override("font_color",Color.WHITE)
var __10QJ=[]
var __INba=0
var __Pd7h=false
func __tfwO():
	GlobalVariables.__APE8=clamp(GlobalVariables.__APE8,0,GlobalVariables.__W58g.size()-1)
	$MenuUI/Tabs/CurrentMapPack.text=GlobalVariables.__W58g[GlobalVariables.__APE8].__SXc7
	if GlobalVariables.__APE8>0:$MenuUI/Tabs/PreviousMapPack.text=GlobalVariables.__W58g[GlobalVariables.__APE8-1].__SXc7
	else:$MenuUI/Tabs/PreviousMapPack.text=""
	if GlobalVariables.__APE8<GlobalVariables.__W58g.size()-1:$MenuUI/Tabs/NextMapPack.text=GlobalVariables.__W58g[GlobalVariables.__APE8+1].__SXc7
	else:$MenuUI/Tabs/NextMapPack.text=""
	if GlobalVariables.__W58g[GlobalVariables.__APE8].__SXc7=="Chapter 4":
		$MenuUI/Ch4Message.visible=true
	else:
		$MenuUI/Ch4Message.visible=false
	___0Jw()
func __ZYHE():
	if GlobalVariables.__cmGH.is_empty():
		return

	GlobalVariables.___mp3=clamp(GlobalVariables.___mp3,0,GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs.size()-1)
	__HdrB($PCUI/CustomsMenu/ScrollContainer/LevelList,GlobalVariables.___mp3,false)
	$MenuUI/ScrollContainer.ensure_control_visible($PCUI/CustomsMenu/ScrollContainer/LevelList.get_child(GlobalVariables.___mp3))
	if GlobalVariables.___mp3>0:
		$PCUI/CustomsMenu/ScrollContainer.ensure_control_visible($PCUI/CustomsMenu/ScrollContainer/LevelList.get_child(GlobalVariables.___mp3-1))
	if GlobalVariables.___mp3<GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs.size()-1:
		$PCUI/CustomsMenu/ScrollContainer.ensure_control_visible($PCUI/CustomsMenu/ScrollContainer/LevelList.get_child(GlobalVariables.___mp3+1))
	$PCUI/CustomsMenu/TrackName.text=GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].__61x0
	$PCUI/CustomsMenu/TrackImage.texture=GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].__bR2lS
	___rOA(true)
	$PCUI/CustomsMenu/TrackDescription.text=GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].description
	$PCUI/CustomsMenu/TrackDifficulty.text="Difficulty: "+GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].__myfq
	$PCUI/CustomsMenu/TrackComposer.text="Composer: "+GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].__5CWF
	$PCUI/CustomsMenu/TrackHighScore.text="High Score: "+str(int(GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].__A6Ai))
	if GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].__gGzJ:$PCUI/CustomsMenu/OldMapScoreText.visible=true
	else:$PCUI/CustomsMenu/OldMapScoreText.visible=false
	$PCUI/CustomsMenu/TrackID.text="Map ID: "+GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].hash
	if false:
		if GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__ujTM=="":
			$MenuUI/Switch8Bit.visible=false
			$MenuUI/ButtonPrompts/AlternateMusic.modulate.a=0.2
		else:
			$MenuUI/Switch8Bit.visible=true
			if Input.is_action_just_pressed("Switch8Bit")or __8vuo:
				GlobalVariables.__zmgV=not GlobalVariables.__zmgV
			if not GlobalVariables.__zmgV:
				$MenuUI/Switch8Bit/Default.add_theme_color_override("font_color",Color.YELLOW)
				$MenuUI/Switch8Bit/Default.add_theme_font_size_override("font_size",30)
				$MenuUI/Switch8Bit/Bit.add_theme_color_override("font_color",Color.WHITE)
				$MenuUI/Switch8Bit/Bit.add_theme_font_size_override("font_size",22)
			else:
				$MenuUI/Switch8Bit/Default.add_theme_color_override("font_color",Color.WHITE)
				$MenuUI/Switch8Bit/Default.add_theme_font_size_override("font_size",22)
				$MenuUI/Switch8Bit/Bit.add_theme_color_override("font_color",Color.YELLOW)
				$MenuUI/Switch8Bit/Bit.add_theme_font_size_override("font_size",30)
			$MenuUI/ButtonPrompts/AlternateMusic.modulate.a=1
var __Jw4q=false
var __yI3N=false
func __u9Lt(__n4X7):
	$SettingsUI.visible=true
	$SettingsUI/ButtonPrompts/LatencyOffsetMap.self_modulate.h=__6p6n/3
	__Oz4K=false
	for __T1Mz in $SettingsUI/SelectableOptions.get_children():
		if __T1Mz is OptionButton:
			if __T1Mz.get_popup().visible:
				__Oz4K=true
	if __Oz4K==false:
		if Input.is_action_just_pressed("KDown")or __CJEj:
			__rcRn+=1
		if Input.is_action_just_pressed("KUp")or __1EEO:
			__rcRn-=1
	var __yJzn=4
	__rcRn=clamp(__rcRn,0,$SettingsUI/SelectableOptions.get_child_count()-1)
	if $SettingsUI/SelectableOptions.get_child(__rcRn)is HScrollBar:
		var __fdy5=0.05
		if __rcRn==0:__fdy5=1
		if Input.is_action_just_pressed("KLeft")or __Vksv:
			$SettingsUI/SelectableOptions.get_child(__rcRn).value-=__fdy5
		if Input.is_action_just_pressed("KRight")or __50rj:
			$SettingsUI/SelectableOptions.get_child(__rcRn).value+=__fdy5
	elif $SettingsUI/SelectableOptions.get_child(__rcRn)is OptionButton:
		if Input.is_action_just_pressed("Confirm")or __XZRz:
			if $SettingsUI/SelectableOptions.get_child(__rcRn).get_popup().visible==false:
				$SettingsUI/SelectableOptions.get_child(__rcRn).show_popup()
			else:
				$SettingsUI/SelectableOptions.get_child(__rcRn).select($SettingsUI/SelectableOptions.get_child(__rcRn).get_popup().get_focused_item())
				__6gW1($SettingsUI/SelectableOptions/ButtonPromptPlat.get_popup().get_focused_item())
				$SettingsUI/SelectableOptions.get_child(__rcRn).get_popup().visible=false
	__HdrB($SettingsUI/SelectableOptions,__rcRn,true)
	__clyr()
	if Input.is_action_just_pressed("Switch8Bit")or __8vuo:
		GlobalVariables.__61x0="Latency Offset Map"
		GlobalVariables.__Dknt="res://Audio/Latency Offset Map.mp3"
		GlobalVariables.__7ZAV="res://Audio/Latency Offset Map.mid"
		GlobalVariables.__4orA=true
		$Music.stop()
		await get_tree().create_timer(0.1).timeout
		var __tNzV=load("res://main.tscn")
		get_tree().change_scene_to_packed(__tNzV)
	if Input.is_action_just_pressed("Cancel")or __rJPo:
		GlobalVariables.__jkDc()
		$SettingsUI.visible=false
		state=State.__6GDt
var __PHFH=[]
func __GWmB():
	GlobalVariables.__WDY2=clamp(GlobalVariables.__WDY2,0,GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs.size()-1)
	__HdrB($MenuUI/ScrollContainer/LevelList,GlobalVariables.__WDY2,false)
	$MenuUI/ScrollContainer.ensure_control_visible($MenuUI/ScrollContainer/LevelList.get_child(GlobalVariables.__WDY2))
	if GlobalVariables.__WDY2>0:
		$MenuUI/ScrollContainer.ensure_control_visible($MenuUI/ScrollContainer/LevelList.get_child(GlobalVariables.__WDY2-1))
	if GlobalVariables.__WDY2<GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs.size()-1:
		$MenuUI/ScrollContainer.ensure_control_visible($MenuUI/ScrollContainer/LevelList.get_child(GlobalVariables.__WDY2+1))
	$MenuUI/TrackName.text=GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__61x0
	$MenuUI/TrackImage.texture=GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__bR2lS
	___rOA(false)
	$MenuUI/TrackDescription.text=GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].description
	$MenuUI/TrackDifficulty.text="Difficulty: "+GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__myfq
	$MenuUI/TrackComposer.text="Composer: "+GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__5CWF
	$MenuUI/TrackHighScore.text="High Score: "+str(int(GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__A6Ai))
	if GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__gGzJ:$MenuUI/OldMapScoreText.visible=true
	else:$MenuUI/OldMapScoreText.visible=false
	$MenuUI/TrackID.text="Map ID: "+GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].hash
	if GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__ujTM=="":
		$MenuUI/Switch8Bit.visible=false
		$MenuUI/ButtonPrompts/AlternateMusic.modulate.a=0.2
	else:
		$MenuUI/Switch8Bit.visible=true
		if Input.is_action_just_pressed("Switch8Bit")or __8vuo:
			GlobalVariables.__zmgV=not GlobalVariables.__zmgV
		if not GlobalVariables.__zmgV:
			$MenuUI/Switch8Bit/Default.add_theme_color_override("font_color",Color.YELLOW)
			$MenuUI/Switch8Bit/Default.add_theme_font_size_override("font_size",30)
			$MenuUI/Switch8Bit/Bit.add_theme_color_override("font_color",Color.WHITE)
			$MenuUI/Switch8Bit/Bit.add_theme_font_size_override("font_size",22)
		else:
			$MenuUI/Switch8Bit/Default.add_theme_color_override("font_color",Color.WHITE)
			$MenuUI/Switch8Bit/Default.add_theme_font_size_override("font_size",22)
			$MenuUI/Switch8Bit/Bit.add_theme_color_override("font_color",Color.YELLOW)
			$MenuUI/Switch8Bit/Bit.add_theme_font_size_override("font_size",30)
		$MenuUI/ButtonPrompts/AlternateMusic.modulate.a=1
var __rcRn=0
var __4RxL=false
func __QQp0():
	if $TouchControls/L.is_pressed():
		__jI1d=true
		if not __roTV:
			__Vksv=true
			__roTV=true
		else:
			__Vksv=false
	else:
		__jI1d=false
		__roTV=false
	if $TouchControls/R.is_pressed():
		__4RxL=true
		if not __yI3N:
			__50rj=true
			__yI3N=true
		else:
			__50rj=false
	else:
		__4RxL=false
		__yI3N=false
	if $TouchControls/U.is_pressed():
		__MG_i=true
		if not __HJZx:
			__1EEO=true
			__HJZx=true
		else:
			__1EEO=false
	else:
		__MG_i=false
		__HJZx=false
	if $TouchControls/D.is_pressed():
		__VyVA=true
		if not __EK22:
			__CJEj=true
			__EK22=true
		else:
			__CJEj=false
	else:
		__VyVA=false
		__EK22=false
	if $TouchControls/Z.is_pressed():
		__pcP_=true
		if not __EeEl:
			__XZRz=true
			__EeEl=true
		else:
			__XZRz=false
	else:
		__pcP_=false
		__EeEl=false
	if $TouchControls/X.is_pressed():
		__qNK_=true
		if not __NA5C:
			__rJPo=true
			__NA5C=true
		else:
			__rJPo=false
	else:
		__qNK_=false
		__NA5C=false
	if $TouchControls/C.is_pressed():
		__93DX=true
		if not __2sgr:
			__8vuo=true
			__2sgr=true
		else:
			__8vuo=false
	else:
		__93DX=false
		__2sgr=false
var __VZQw=0.0
func __Ejzd(__EcXV):
	$PCUI.visible=true
	$PCUI/CustomsMenu/ButtonPrompts/AlternateMusic.self_modulate.h=__6p6n/3
	$PCUI/CustomsMenu/ButtonPrompts/AlternateMusic/AlternateMusic2.self_modulate.h=__6p6n/3
	if OS.get_name()!="Web" and GlobalVariables.__cmGH.size()>0:
		if Input.is_action_just_pressed("KDown")or __CJEj:
			GlobalVariables.___mp3+=1
		if Input.is_action_just_pressed("KUp")or __1EEO:
			GlobalVariables.___mp3-=1
		if Input.is_action_pressed("KDown")or __CJEj:
			__VZQw+=__EcXV
			if __VZQw>0.5:
				__IOL8+=__EcXV
				if __VZQw>2:
					__IOL8+=__EcXV
				if __IOL8>0.1:
					GlobalVariables.___mp3+=1
					__IOL8=0
		elif Input.is_action_pressed("KUp")or __1EEO:
			__VZQw+=__EcXV
			if __VZQw>0.5:
				__IOL8+=__EcXV
				if __VZQw>2:
					__IOL8+=__EcXV
				if __IOL8>0.1:
					GlobalVariables.___mp3-=1
					__IOL8=0
		else:
			__VZQw=0
			__IOL8=0
		if Input.is_action_just_pressed("TabLeft")or __Vksv:
			GlobalVariables.__INba-=1
			GlobalVariables.___mp3=0
			__kx99()
		if Input.is_action_just_pressed("TabRight")or __50rj:
			GlobalVariables.__INba+=1
			GlobalVariables.___mp3=0
			__kx99()
		__ZYHE()
		if false:
			GlobalVariables.___mp3=clamp(GlobalVariables.___mp3,0,__iZA4.size()-1)
			__HdrB($PCUI/CustomsMenu/ScrollContainer/LevelList,GlobalVariables.___mp3,false)
			$PCUI/CustomsMenu/ScrollContainer.ensure_control_visible($PCUI/CustomsMenu/ScrollContainer/LevelList.get_child(GlobalVariables.___mp3))
			if GlobalVariables.___mp3>0:
				$PCUI/CustomsMenu/ScrollContainer.ensure_control_visible($PCUI/CustomsMenu/ScrollContainer/LevelList.get_child(GlobalVariables.___mp3-1))
			if GlobalVariables.___mp3<__iZA4.size()-1:
				$PCUI/CustomsMenu/ScrollContainer.ensure_control_visible($PCUI/CustomsMenu/ScrollContainer/LevelList.get_child(GlobalVariables.___mp3+1))
			$PCUI/CustomsMenu/TrackName.text=__iZA4[GlobalVariables.___mp3].__61x0
			$PCUI/CustomsMenu/TrackImage.texture=__iZA4[GlobalVariables.___mp3].__bR2lS
			___rOA(true)
			$PCUI/CustomsMenu/TrackDescription.text=__iZA4[GlobalVariables.___mp3].description
			$PCUI/CustomsMenu/TrackDifficulty.text="Difficulty: "+__iZA4[GlobalVariables.___mp3].__myfq
			$PCUI/CustomsMenu/TrackComposer.text="Composer: "+__iZA4[GlobalVariables.___mp3].__5CWF
			$PCUI/CustomsMenu/TrackHighScore.text="High Score: "+str(int(__iZA4[GlobalVariables.___mp3].__A6Ai))
			if __iZA4[GlobalVariables.___mp3].__gGzJ:$PCUI/CustomsMenu/OldMapScoreText.visible=true
			else:$PCUI/CustomsMenu/OldMapScoreText.visible=false
			$PCUI/CustomsMenu/TrackID.text="Map ID: "+__iZA4[GlobalVariables.___mp3].hash
		if Input.is_action_just_pressed("Switch8Bit")or __8vuo:
			OS.shell_open("https://ezioeagle.itch.io/lightners-live-plus")
		if Input.is_action_just_pressed("Confirm")or __XZRz:
			if __Jw4q:print("loading level")
			__AeQh(true)
	if GlobalVariables.__cmGH.size()==0 and OS.get_name()!="Web":$PCUI/NoCustomsMessage.visible=true
	else:$PCUI/NoCustomsMessage.visible=false
	if Input.is_action_just_pressed("Cancel")or __rJPo:
		$PCUI.visible=false
		state=State.__6GDt
var __NA5C=false
func _draw():
	if state==State.menu:
		__sYJd($MenuUI/Black)
	elif state==State.__5Uuzt:
		__sYJd($SettingsUI/Black)
	elif state==State.__JCCG:
		__sYJd($CreditsUI/Black)
	elif state==State.__Ejzd:
		__sYJd($PCUI/Black)
	elif state==State.__Lk1L:
		__sYJd($FirstTimeMessage/Black)
var __6p6n=0.0
