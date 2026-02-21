extends Node2D
func __90u1():
	if FileAccess.file_exists(GlobalVariables.__Dknt):
		if GlobalVariables.__Dknt.ends_with(".mp3"):
			$Music.stream=AudioStreamMP3.load_from_file(GlobalVariables.__Dknt)
		if GlobalVariables.__Dknt.ends_with(".wav"):
			$Music.stream=AudioStreamWAV.load_from_file(GlobalVariables.__Dknt)
		if GlobalVariables.__Dknt.ends_with(".ogg"):
			$Music.stream=AudioStreamOggVorbis.load_from_file(GlobalVariables.__Dknt)
	$Music.volume_db=float(GlobalVariables.__Uhqn)
	if GlobalVariables.__7ZAV=="":GlobalVariables.__7ZAV=GlobalVariables.__61x0
	var __Spiu=MidiResource.new()
	if __Spiu.load_file(GlobalVariables.__7ZAV)!=OK:
		printerr("Failed to load Midi file: "+GlobalVariables.__7ZAV)
	$MidiPlayer.midi=__Spiu
var __zClh=0
var __XhJ8=0.5 
var __v5NY=0
func __Z_XI():
	$Stage/KrisBig.frame=$Stage/Kris.frame
	$Stage/KrisBig.animation=$Stage/Kris.animation
	$Stage/RalseiBig.animation=$Stage/Ralsei.animation
	$Stage/RalseiBig.frame=$Stage/Ralsei.frame
var __9Gyf=-1
var __iJdv=4
func lerp(__u_za,__gmqb,__H1lN7):
	return __u_za+(__gmqb-__u_za)*__H1lN7
func __MdIr():
	var __x1LE=$Notes/SusieNotes.get_children()+$Notes/RalseiNotes.get_children()+$Notes/SusieAnimNotes.get_children()+$Notes/RalseiAnimNotes.get_children()
	for __cgDo in __x1LE:
		if __cgDo.position.y>$Target.position.y:
			match __cgDo.__Nv5i:
				GlobalVariables.__OxNx.__pxdo:
					$Stage/Susie.play("Middle")
				GlobalVariables.__OxNx.__X13L:
					$Stage/Susie.play("Right")
				GlobalVariables.__OxNx.__uG3Y:
					$Stage/Susie.play("Left")
				GlobalVariables.__OxNx.__aIOK:
					if $Stage/Ralsei.animation!="SingClosed" and $Stage/Ralsei.animation!="SingOpen":
						$Stage/Ralsei.play("SingOpen")
						print("break")
						break
					if __cgDo.__fbAq:
						if $Stage/Ralsei.animation=="SingClosed":
							var __pZjd=$Stage/Ralsei.frame
							var __oETg=$Stage/Ralsei.frame_progress
							$Stage/Ralsei.play("SingOpen")
							$Stage/Ralsei.frame=__pZjd
							$Stage/Ralsei.frame_progress=__oETg
					else:
						if $Stage/Ralsei.animation=="SingOpen":
							var __tTo1=$Stage/Ralsei.frame
							var __RiTj=$Stage/Ralsei.frame_progress
							$Stage/Ralsei.play("SingClosed")
							$Stage/Ralsei.frame=__tTo1
							$Stage/Ralsei.frame_progress=__RiTj
				GlobalVariables.__OxNx.__Wjmg:
					if $Stage/Ralsei.animation!="SingClosed" and $Stage/Ralsei.animation!="SingOpen":
						$Stage/Ralsei.play("SingOpen")
						print("break")
						break
					if __cgDo.__fbAq:
						if $Stage/Ralsei.animation=="SingClosed":
							var __vQfa=$Stage/Ralsei.frame
							var __QXXD=$Stage/Ralsei.frame_progress
							$Stage/Ralsei.play("SingOpen")
							$Stage/Ralsei.frame=__vQfa
							$Stage/Ralsei.frame_progress=__QXXD
					else:
						if $Stage/Ralsei.animation=="SingOpen":
							var __ymOf=$Stage/Ralsei.frame
							var __uZUF=$Stage/Ralsei.frame_progress
							$Stage/Ralsei.play("SingClosed")
							$Stage/Ralsei.frame=__ymOf
							$Stage/Ralsei.frame_progress=__uZUF
				GlobalVariables.__OxNx.__kmKG:
					if $Stage/Ralsei.animation!="SingClosed" and $Stage/Ralsei.animation!="SingOpen":
						$Stage/Ralsei.play("SingOpen")
						print("break")
						break
					if __cgDo.__fbAq:
						if $Stage/Ralsei.animation=="SingClosed":
							var __xGDP=$Stage/Ralsei.frame
							var __CAUH=$Stage/Ralsei.frame_progress
							$Stage/Ralsei.play("SingOpen")
							$Stage/Ralsei.frame=__xGDP
							$Stage/Ralsei.frame_progress=__CAUH
					else:
						if $Stage/Ralsei.animation=="SingOpen":
							var __HP0n=$Stage/Ralsei.frame
							var __aVxl=$Stage/Ralsei.frame_progress
							$Stage/Ralsei.play("SingClosed")
							$Stage/Ralsei.frame=__HP0n
							$Stage/Ralsei.frame_progress=__aVxl
				GlobalVariables.__OxNx.__vtpn:
					$Stage/Ralsei.play("Rock1")
				GlobalVariables.__OxNx.__CSyO:
					$Stage/Ralsei.play("Clap")
				GlobalVariables.__OxNx.__V4Iy:
					$Stage/Ralsei.play("SingFull")
			$DebugDisplay.text="Last note was "+GlobalVariables.__OxNx.keys()[GlobalVariables.__OxNx.values().find(__cgDo.__Nv5i)]+"\n Ralsei's current anim is "+$Stage/Ralsei.animation
			__cgDo.queue_free()
var __O9KP=0
var __ld2j=0
var __nx_v=20
var __yI3N=false
func _process(__19OK):
	__ZBlz+=__19OK
	__QQp0()
	__bcgO()
	var __V1bO=false
	if __V1bO:
		var __pRJF=14.14 
		var __iZx1=14.57
		if $Music.get_playback_position()<__pRJF:
			$Stage.self_modulate.a=0
		elif $Music.get_playback_position()>__iZx1:
			$Stage.self_modulate.a=1
		else:
			$Stage.self_modulate.a=($Music.get_playback_position()-__pRJF)/(__iZx1-__pRJF)
			print($Stage.self_modulate.a)
	if not __m09I:
		if $Music.get_playback_position()>0.1:
			$Music.stop()
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),linear_to_db(GlobalVariables.__7l9E))
			__m09I=true
	if!$Music.playing and not __lzIh:
		__zClh+=__19OK
		if __zClh>GlobalVariables.__FyRA and $MidiPlayer.current_time==0 and __EW_K==false:
			$MidiPlayer.play()
			__EW_K=true
			print("$MidiPlayer.play() has been ran")
		if $MidiPlayer.current_time>0:
			__3YXo+=__19OK
			if __3YXo>=__4CIs:
				print("played music")
				$Music.play()
				__lzIh=true
	___mCQ(__19OK)
	___5MC()
	if __uT2g:__MdIr()
	__QjHt+=__19OK
	__rlil+=__19OK
	if Input.is_action_just_pressed("L")or __Vksv:
		__QjHt=0.1
	if Input.is_action_just_pressed("R")or __50rj:
		__rlil=0.1
	if __QjHt>1:__QjHt=1
	if __rlil>1:__rlil=1
	if __QjHt<__DJ8D:
		var __JIiP=lerp(__XP1L/2,__XP1L,__QjHt*4)
		$Target/TargetL.scale=Vector2(__JIiP,__JIiP)
	if __rlil<__DJ8D:
		var __PK8c=lerp(__XP1L/2,__XP1L,__rlil*4)
		$Target/TargetR.scale=Vector2(__PK8c,__PK8c)
	__Qidk-=__Vqw7*__19OK
	__y0Z7-=__Vqw7*__19OK
	if __Qidk<0:__Qidk=0
	if __y0Z7<0:__y0Z7=0
	$Target/TargetL/TargetFlash.scale.x=18*__Qidk
	$Target/TargetR/TargetFlash.scale.x=18*__y0Z7
	for __PJrV in len(__C_xz):
		__C_xz[__PJrV].x+=GlobalVariables.__fRk1*__19OK
		__C_xz[__PJrV].y+=GlobalVariables.__fRk1*__19OK
		if __C_xz[__PJrV].w==1:
			__C_xz[__PJrV].y=__U1AR.y+GlobalVariables.__GVAR+__7QCr
		if __C_xz[__PJrV].x>__igK2:
			__C_xz[__PJrV].x=__igK2
		if __C_xz[__PJrV].y>__igK2:
			__C_xz[__PJrV].w=-1 
			var __xbS5Z
	for __Kxo3 in range(len(__C_xz)-1,-1,-1):
		if __C_xz[__Kxo3].w==-1:
			__C_xz.remove_at(__Kxo3)
			var ___iuOl
	$Target/TargetL/HitParticles.emitting=false
	$Target/TargetR/HitParticles.emitting=false
	__pRTt=false
	___NEZ=false
	__nzJ4=false
	__or5r=false
	if Input.is_action_pressed("L")or __jI1d:__W4Z4(0,__19OK)
	if Input.is_action_pressed("R")or __4RxL:__W4Z4(1,__19OK)
	if Input.is_action_just_pressed("L")or __Vksv:__CwJp("L")
	if Input.is_action_just_pressed("R")or __50rj:__CwJp("R")
	if Input.is_action_just_pressed("L")or __Vksv:
		if not __pRTt and not __nzJ4 and $Music.playing and GlobalVariables.__C3dv>0:
			$WrongHitAudio.play()
			GlobalVariables.__C3dv+=__aAQi
			$Target/NoteScoreTextL.text=str(__aAQi)
			__cxCu[0]=1.1
			GlobalVariables.__ZErl=0
	if Input.is_action_just_pressed("R")or __50rj:
		if not ___NEZ and not __or5r and $Music.playing and GlobalVariables.__C3dv>0:
			$WrongHitAudio.play()
			GlobalVariables.__C3dv+=__aAQi
			$Target/NoteScoreTextR.text=str(__aAQi)
			__cxCu[1]=1.1
			GlobalVariables.__ZErl=0
	if GlobalVariables.__C3dv<0:GlobalVariables.__C3dv=0
	if Input.is_action_pressed("QuitMap")or __qNK_ or __rJPo:
		__6Krl+=__19OK
	else:__6Krl=0
	$Target/ReturnToMenuPrompt/Progress.value=__6Krl
	if __6Krl>1.5:
		if GlobalVariables.__4orA:GlobalVariables.__jkDc()
		__7GAk()
	if GlobalVariables.__4orA:
		if Input.is_action_just_pressed("KUp"):
			GlobalVariables.__GVAR+=1
		if Input.is_action_just_pressed("KDown"):
			GlobalVariables.__GVAR-=1
		$LatenencyOffsetMapText.text="Use Up and Down to Change Latency Offset: "+str(GlobalVariables.__GVAR)
	queue_redraw()
	__p6eV(__19OK)
	__RqOl(__19OK)
	__Z_XI()
	__CwID()
	__4Ssp()
	__51r9()
	if GlobalVariables.__ZErl>GlobalVariables.__iqDC:GlobalVariables.__iqDC=GlobalVariables.__ZErl
	__VH3w+=$Music.get_playback_position()-$MidiPlayer.current_time+__4CIs
	__o_9X+=1
	if __o_9X>=30:
		__cQEI=__VH3w/30
		__VH3w=0
		__o_9X=0
	__7QCr=__cQEI*GlobalVariables.__fRk1
	if $Music.playing==false or $Music.get_playback_position()<0.3:
		__7QCr=0
	if Input.is_action_just_pressed("ShowFPS"):__847u=not __847u
	if __847u:
		$FPSDisplay.visible=true
	else:
		$FPSDisplay.visible=false
	$FPSDisplay.text=str(int(1/__19OK))+"\nmidi:   "+str($MidiPlayer.current_time)+"\nmusic: "+str($Music.get_playback_position())+"\ndesync: "+str(__cQEI)+"\ndesyncOffset: "+str(__7QCr)+"\nscore: "+str(GlobalVariables.__C3dv)
	if __ZBlz>1 and tempo==-1:
		$FPSDisplay.text+="\nError: tempo is -1, meaning midi failed to load: "+str($MidiPlayer.midi.get_tempo())
	if __ZBlz>4 and $Music.get_playback_position()<1:
		$FPSDisplay.text+="\nError: music still hasn't started"
	__hbwA(__19OK)
	if Input.is_action_just_pressed("Confirm")and false:
		$MidiPlayer.current_time=__4CIs
		$Music.seek(0)
	if tempo==-1 and __ZBlz>2:
		$MapFailedToLoadText.visible=true
	if $MapFailedToLoadText.visible==true:
		$LagWarning.visible=false
var __T0T8
func _draw():
	__AsNM()
	for ___I5Z in __C_xz:
		if ___I5Z.x>__Ukm5:
			var __Szp0=float(__U1AR.x)
			var __lsqI=__MaDf
			if abs(___I5Z.x-__3YB7)<=10 and((___I5Z.z==0 and(Input.is_action_pressed("L")or __jI1d))or(___I5Z.z==1 and(Input.is_action_pressed("R")or __4RxL))):
				__Szp0=float(__U1AR.x)+(2*sin(float(Time.get_ticks_msec())/30))
				__lsqI*=1.5
			var __kcUi=__dPLh
			if ___I5Z.z==1:
				__Szp0+=__E3EG
				__kcUi=__GFh4
			var __VonI=___I5Z.y
			if ___I5Z.y<__Ukm5+2:
				__VonI=__Ukm5+2
			draw_line(Vector2(__Szp0,___I5Z.x),Vector2(__Szp0,__VonI),__kcUi,__lsqI)
var __Vqw7=3
func ___xGt(__FkVu,__FpTi):
	pass
func __51r9():
	for __gfoH in $Notes/KrisNotes.get_children():
		if __gfoH.position.y<__Ukm5:
			__gfoH.visible=false
		else:
			__gfoH.visible=true
var __or5r=false
var __DsGk=0
var __0JcW=0.0
var __VcW_=true
func __xqjS():
	var __6UeA={}
	if FileAccess.file_exists(GlobalVariables.___sH9):
		var __YvsP=FileAccess.open(GlobalVariables.___sH9,FileAccess.READ)
		__6UeA=JSON.parse_string(__YvsP.get_as_text())
		if __6UeA==null:
			__6UeA={}
	var __R9DB=GlobalVariables.__7ZAV.split("/")
	var __NOXR=str(__R9DB[-1])
	var __YwdV=__NOXR.left(-4)
	if not __6UeA.has(__YwdV):
		__6UeA[__YwdV]={}
		__K1_Y=true
	var __Xmq8=__6UeA[__YwdV]
	if __Xmq8.has(GlobalVariables.__7Rpg):
		var __ljz3=float(__Xmq8[GlobalVariables.__7Rpg])
		if GlobalVariables.__p6vQ!="":
					if __Xmq8.has(GlobalVariables.__p6vQ):
						if float(__Xmq8[GlobalVariables.__p6vQ])>__ljz3:
							__ljz3=float(__Xmq8[GlobalVariables.__p6vQ])
		if GlobalVariables.__C3dv>__ljz3:
			__Xmq8[GlobalVariables.__7Rpg]=GlobalVariables.__C3dv
			__K1_Y=true
	else:
		__Xmq8[GlobalVariables.__7Rpg]=GlobalVariables.__C3dv
	var __dgdh=FileAccess.open(GlobalVariables.___sH9,FileAccess.WRITE)
	__dgdh.store_string(JSON.stringify(__6UeA,"\t"))
	if GlobalVariables.__NnDK==false:
		if GlobalVariables.__C3dv>GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__A6Ai:
			GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__A6Ai=GlobalVariables.__C3dv
			GlobalVariables.__W58g[GlobalVariables.__APE8].__Okfs[GlobalVariables.__WDY2].__gGzJ=false
	else:
		if GlobalVariables.__C3dv>GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].__A6Ai:
			GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].__A6Ai=GlobalVariables.__C3dv
			GlobalVariables.__cmGH[GlobalVariables.__INba].__Okfs[GlobalVariables.___mp3].__gGzJ=false
var __uT2g=false
func __v6Pu():
	var __wbsO="res://Sprites/ButtonPromps/"
	GlobalVariables.__HHFV=int(GlobalVariables.__HHFV)
	match GlobalVariables.__HHFV:
		0:
			__wbsO+="Keyboard"
		1:
			__wbsO+="Xbox"
		2:
			__wbsO+="PS"
	if GlobalVariables.__HHFV==0:
		$Target/ReturnToMenuPrompt.texture=load(__wbsO+"/Menu.png")
	else:
		$Target/ReturnToMenuPrompt.texture=load(__wbsO+"/Quit.png")
func __5V3Z():
	var __7zOn
	if GlobalVariables.__Dknt!="":
		if GlobalVariables.__NnDK:
			$Music.stream=AudioStreamMP3.load_from_file(GlobalVariables.__Dknt)
		else:
			__7zOn=ResourceLoader.load(GlobalVariables.__Dknt)
			if __7zOn:
				$Music.stream=__7zOn
			else:
				printerr("Failed to load audio: ",GlobalVariables.__Dknt)
	$Music.volume_db=float(GlobalVariables.__Uhqn)
	$Music.play()
	$Music.stop()
	if GlobalVariables.__7ZAV=="":
		GlobalVariables.__7ZAV=GlobalVariables.__61x0.left(-3)+"mid"
	var __Ivbr
	if GlobalVariables.__NnDK:
		$MidiPlayer.midi=MidiResource.new()
		$MidiPlayer.midi.load_file(GlobalVariables.__7ZAV)
	else:
		__Ivbr=ResourceLoader.load(GlobalVariables.__7ZAV)
		if __Ivbr:
			$MidiPlayer.midi=__Ivbr
	__6dIT=AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music"))
var __Ukm5=0
var __hdNs=true
var __GFh4=Color8(74,215,252,255)
func __AsNM():
	var __IUzo=$Target/Black.global_position-(Vector2(($Target/Black.get_texture().get_width()*0.5)*$Target/Black.scale.x*$Target.scale.x,($Target/Black.get_texture().get_height()*0.5)*$Target/Black.scale.y*$Target.scale.y))
	var __nRXL=Vector2($Target/Black.get_texture().get_width()*$Target/Black.scale.x*$Target.scale.x,$Target/Black.get_texture().get_height()*$Target/Black.scale.y*$Target.scale.y)
	var __oYlh=Vector2(__iJdv*0.5,0)
	draw_line(__IUzo-__oYlh,__IUzo+Vector2(__nRXL.x,0)+__oYlh,__9F1_,__iJdv)
	draw_line(__IUzo+Vector2(0,__nRXL.y)-__oYlh,__IUzo+Vector2(__nRXL.x,__nRXL.y)+__oYlh,__9F1_,__iJdv)
	draw_line(__IUzo,__IUzo+Vector2(0,__nRXL.y),__9F1_,__iJdv)
	draw_line(__IUzo+Vector2(__nRXL.x,0),__IUzo+Vector2(__nRXL.x,__nRXL.y),__9F1_,__iJdv)
	var __16js=__IUzo.x
	var __mzvx=__IUzo.x+__nRXL.x
	for __srmS in __taNO:
		if __srmS.x>__Ukm5:
			draw_line(Vector2(__16js,__srmS.x),Vector2(__mzvx,__srmS.x),__9F1_/2,3)
var __rJPo=false
func __4Ssp():
	$Stage/CircleLightC.position.y=57+(2*sin(float(Time.get_ticks_msec())/400))
	$Stage/CircleLightL.position.y=$Stage/CircleLightC.position.y
	$Stage/CircleLightR.position.y=$Stage/CircleLightC.position.y
func __CwID():
	if $Stage/Kris.animation=="Left":
		$Stage/Kris.position=__UUGQ+Vector2(0,2)
		$Stage/KrisBig.position=__Pq4G+(Vector2(0,2)*3)
	elif $Stage/Kris.animation=="Right":
		$Stage/Kris.position=__UUGQ
		$Stage/KrisBig.position=__Pq4G
	elif $Stage/Kris.animation=="Pose":
		$Stage/Kris.position=__UUGQ
		$Stage/KrisBig.position=__Pq4G
	elif $Stage/Kris.animation=="Pose":
		$Stage/Kris.position=__UUGQ+Vector2(1,1)
		$Stage/KrisBig.position=__Pq4G+(Vector2(1,1)*3)
var __tsDo
var __ZkB5=0
var ___NEZ=false
var __JP5n
var __jI1d=false
var __ItuC=0
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
var __ZBlz=0
var __QjHt=0
func __p6eV(__eY3z):
	if GlobalVariables.__ZErl<=9:
		$Stage/ComboNumber["theme_override_font_sizes/font_size"]=__GXRz[0]
		$Stage/ComboNumber.text="0"+str(GlobalVariables.__ZErl)
		$Stage/ComboNumber.position.y=-62
	elif GlobalVariables.__ZErl<=99:
		$Stage/ComboNumber["theme_override_font_sizes/font_size"]=__GXRz[1]
		$Stage/ComboNumber.text=str(GlobalVariables.__ZErl)
		$Stage/ComboNumber.position.y=-62
	elif GlobalVariables.__ZErl<=999:
		$Stage/ComboNumber["theme_override_font_sizes/font_size"]=__GXRz[2]
		$Stage/ComboNumber.text=str(GlobalVariables.__ZErl)
		$Stage/ComboNumber.position.y=-54
	elif GlobalVariables.__ZErl<=9999:
		$Stage/ComboNumber["theme_override_font_sizes/font_size"]=__GXRz[3]
		$Stage/ComboNumber.text=str(GlobalVariables.__ZErl)
		$Stage/ComboNumber.position.y=-50
	elif GlobalVariables.__ZErl<=99999:
		$Stage/ComboNumber["theme_override_font_sizes/font_size"]=__GXRz[4]
		$Stage/ComboNumber.text=str(GlobalVariables.__ZErl)
		$Stage/ComboNumber.position.y=-48
	$Stage/ScoreNumber.text=str(int(GlobalVariables.__C3dv))
	$Stage/MaxComboNumber.text=str(GlobalVariables.__iqDC)
	var __RT3P=clamp(remap(float($Target/NoteScoreTextL.text),75,97,0,0.333),0,0.333)
	var __aaHB=clamp(remap(float($Target/NoteScoreTextR.text),75,97,0,0.333),0,0.333)
	$Target/NoteScoreTextL.modulate=Color.from_hsv(__RT3P,1,1,__cxCu[0])
	$Target/NoteScoreTextR.modulate=Color.from_hsv(__aaHB,1,1,__cxCu[1])
	if $Target/NoteScoreTextL.text.left(1)!="+" and float($Target/NoteScoreTextL.text)>0:$Target/NoteScoreTextL.text="+"+$Target/NoteScoreTextL.text
	if $Target/NoteScoreTextR.text.left(1)!="+" and float($Target/NoteScoreTextR.text)>0:$Target/NoteScoreTextR.text="+"+$Target/NoteScoreTextR.text
	__cxCu[0]=__cxCu[0]-(1*__eY3z)
	__cxCu[1]=__cxCu[1]-(1*__eY3z)
func __cn1_(__lSjj):
	if __lSjj.z==1:return true
	else:return false
func _ready():
	print("ready. Map ID is "+GlobalVariables.__7Rpg)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),linear_to_db(-100))
	__5V3Z()
	$Music.play()
	print("played music preload")
	__tsDo=preload("res://Note.tscn")
	__3YB7=$Target.position.y
	var __WM9L=__3YB7-__U1AR.y
	__4CIs=__WM9L/GlobalVariables.__fRk1
	__igK2=$Target/Black.global_position.y+($Target/Black.get_texture().get_height()*0.5)*$Target/Black.scale.y*$Target.scale.y-__iJdv+2
	__UUGQ=$Stage/Kris.position
	__Pq4G=$Stage/KrisBig.position
	$MidiPlayer.note.connect(__KuUR)
	__3YXo=0
	if Input.is_key_label_pressed(KEY_F10)and false:
		__uT2g=true
		if GlobalVariables.__Ohli.__NwuX==true:
			$Stage/Susie.play("Idle")
		if GlobalVariables.__Ohli.__vvg1==true:
			$Stage/Ralsei.play("Rock1")
	__9F1_=__GFh4
	$Target/TargetL.self_modulate=__dPLh
	$Target/TargetR.self_modulate=__GFh4
	$Target/TargetL/HitParticles.modulate=__dPLh
	$Target/TargetR/HitParticles.modulate=__GFh4
	__ZkB5=$Stage/ScoreNumber.position.x
	__O9KP=$Stage/ComboNumber["theme_override_font_sizes/font_size"]
	$Target/NoteScoreTextL.text=""
	$Target/NoteScoreTextR.text=""
	__JP5n=$Beep.volume_linear
	__DsGk=$Target/Black.scale.x
	__Ukm5=$Target/Black.global_position.y-($Target/Black.get_texture().get_height()*0.5)*$Target/Black.scale.y*$Target.scale.y
	$MapNameText.text=GlobalVariables.__61x0
	$MapIDText.text="Map ID: "+GlobalVariables.__7Rpg
	$MapNameText.visible_ratio=0
	$MapIDText.visible_ratio=0
	if OS.has_feature("web_android")or OS.has_feature("web_ios")or OS.get_name()=="Android":
		$TouchControls.visible=true
	else:
		$TouchControls.visible=false
	__v6Pu()
	if GlobalVariables.__4orA:
		$LatenencyOffsetMapText.visible=true
	else:
		$LatenencyOffsetMapText.visible=false
	__T0T8=RandomNumberGenerator.new()
var __D54l=false
var __Vksv=false
var __847u=false
var __uqwa=0.0
var __6Krl=0
var __Jw4q=false
var __Pq4G
var __U1AR=Vector2(460,72-72)
var __ibo5=0.0
var __lzIh=false
func ___5MC():
	if tempo==-1 and $MidiPlayer.current_time>0:
		var __hhrv=tempo
		tempo=60000000.0/$MidiPlayer.midi.get_tempo()
		print("Tempo: "+str(tempo))
		__0JcW=60.0/tempo
		if __hdNs and tempo!=__hhrv:
			$Stage/Susie.sprite_frames.set_animation_speed("default",(tempo/60)*4)
			$Stage/Ralsei.sprite_frames.set_animation_speed("default",(tempo/60)*2)
			$Stage/Ralsei.sprite_frames.set_animation_speed("Clap",(tempo/60)*3)
			$Stage/Ralsei.sprite_frames.set_animation_speed("SingOpen",(tempo/60)*2)
			$Stage/Ralsei.sprite_frames.set_animation_speed("SingClosed",(tempo/60)*2)
var __o_9X=0
func __W4Z4(__lRgi,__59Us):
	var __9VHG
	for __XiBb in len(__C_xz):
		if __C_xz[__XiBb].z==__lRgi:
			if __3YB7>=__C_xz[__XiBb].y and __3YB7+5<=__C_xz[__XiBb].x:
				GlobalVariables.__C3dv+=__XhJ8*GlobalVariables.__fRk1*__59Us
				__C_xz[__XiBb].x=__3YB7
				if __3YB7-__nx_v<=__C_xz[__XiBb].y:
					var __UPWs=(__3YB7-__nx_v)-__C_xz[__XiBb].y
					GlobalVariables.__C3dv+=__XhJ8*__UPWs
					__C_xz[__XiBb].w=-1
				if __lRgi==0:
					__Qidk=1-(0.1*sin(float(Time.get_ticks_msec())/30))
					$Target/TargetL/HitParticles.emitting=true
					__pRTt=true
				if __lRgi==1:
					__y0Z7=1-(0.1*sin(float(Time.get_ticks_msec())/30))
					$Target/TargetR/HitParticles.emitting=true
					___NEZ=true
var __dPLh=Color8(0,180,182,255)
var __y0Z7=0
var __4CIs=1 
var __MaDf=6
var __ZYST=false
var __7QCr=0.0
func __CwJp(__76ot):
	var __1DMI=10000 
	var __Qel7
	var __snlh=0
	for __n2ia in $Notes/KrisNotes.get_children():
		if __n2ia.__vQS1B==__76ot and __n2ia.__U6Ua==false:
			if abs(__3YB7-__n2ia.position.y)<__1DMI:
				__1DMI=abs(__3YB7-__n2ia.position.y)
				__Qel7=__n2ia 
	if __1DMI<__qRiE:
		__Qel7.__U6Ua=true
		__snlh=int(75+(__mdSZ-__1DMI*5)/4)
		GlobalVariables.__C3dv+=__snlh
		GlobalVariables.__ZErl+=1
		__ld2j+=1
		if(__76ot=="L"):
			$Target/NoteScoreTextL.text=str(__snlh)
			__cxCu[0]=1.1
			__Qidk=1
			__pRTt=true
		if(__76ot=="R"):
			$Target/NoteScoreTextR.text=str(__snlh)
			__cxCu[1]=1.1
			__y0Z7=1
			___NEZ=true
		$Beep.volume_linear=__JP5n*(float(int(50+(__mdSZ-__1DMI*5)/2))/100)
		$Beep.play()
		if __snlh>90:
			$GreatHitAudio.play()
	elif __1DMI>__qRiE*4:
		if __76ot=="L":
			__nzJ4=true
		if __76ot=="R":
			__or5r=true
var __E3EG=40
func __M9IN()->void:
	__ZYST=true
func __i4Qf(__f454):
	if __f454.z==0:return true
	else:return false
var __K1_Y=false
func __7GAk():
	__HYja()
	var __AnxA=load("res://Menu.tscn")
	get_tree().change_scene_to_packed(__AnxA)
var __nzJ4=false
var __roTV=false
var __qNK_=false
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
	if $TouchControls/X.is_pressed():__qNK_=true
	else:__qNK_=false
var __V_dj="Well I guess you decomped the game huh. Well, there's not really much in terms of secrets in it, apart from the secret of how awful my code is lmao (tbf it's not as bad as what you're seeing lol).
Seriously I really need to refactor all of this why is it still all in one file omg, whatever I'll do it eventually.
Kinda wish people wouldn't decomp it, in case I do add secrets in a future update, but at the same time I guess me writing this is just encouraging it, so oh well
Totally understand why Toby didn't want people datamining Undertale
So yea, it would be cool if you didn't share this, maybe if you don't, I'll put proper secrets in eventually"
func _init():
	pass
func __7l80(__QpxD,__lesq):
	pass
func __HYja():
	GlobalVariables.__C3dv=0
	GlobalVariables.__ZErl=0
	GlobalVariables.__iqDC=0
	GlobalVariables.__QUav=0
var __3YXo=0
func ___mCQ(__NLeV):
	if __zClh>GlobalVariables.__FyRA:
		if __taNO.size()>0:
			for __Dz7I in __taNO.size()-1:
				__taNO[__Dz7I].x+=GlobalVariables.__fRk1*__NLeV 
		__y14C-=__NLeV
		if __y14C<0:__y14C=0
		if $MidiPlayer.current_time>=__uqwa:
			__taNO.push_back(Vector2(__U1AR.y+GlobalVariables.__GVAR+__7QCr,0))
			__uqwa+=__0JcW
		if __taNO[0].x>__igK2:
			__taNO.remove_at(0)
var __ORad=false
var __EYht=false
var __xhRr=-1
var __v8qe=false
var __gV3Z=10
var __27Ye=0
var __50rj=false
var __m09I=false
var __6dIT=0
var __igK2=322 
var __XP1L=2
var __q9l_=0.0
func __RqOl(__OGe2):
	if Input.is_action_just_pressed("L")or __Vksv:
		if __q5Zb():$Stage/Kris.animation="Pose"
		else:$Stage/Kris.animation="Left"
		$Stage/Kris.play()
		__VcW_=false
	if Input.is_action_just_pressed("R")or __50rj:
		if __q5Zb():$Stage/Kris.animation="Pose"
		else:$Stage/Kris.animation="Right"
		$Stage/Kris.play()
		__VcW_=false
	if __VcW_==false:
		if Input.is_action_pressed("L")or __jI1d or Input.is_action_pressed("R")or __4RxL:
			$Stage/Kris.frame=0
			__q9l_+=__OGe2
		else:
			$Stage/Kris.frame=1
			__q9l_=0
		if __q9l_>0.5:
			pass
	if __VcW_:
		$Stage/Kris.animation="Idle"
var __GXRz=[41,41,27,20,16]
func __q5Zb():
	if $Music.playing==false or GlobalVariables.__C3dv==0:
		__ItuC=0
		return false
	var __sTTV=10000000
	var __r46D=100
	for __xkEG in $Notes/KrisNotes.get_children():
		if abs(__3YB7-__xkEG.position.y)<__sTTV and __xkEG.position.y<__3YB7:
			__sTTV=abs(__3YB7-__xkEG.position.y)
	if $Stage/Kris.animation=="Pose" and __sTTV>__r46D*(__ItuC+2):
		__ItuC+=1
		return true
	if __sTTV>__r46D:
		__ItuC+=1
		return true
		__ItuC=0
	return false
var __EW_K=false
var __Qidk=0
var __mdSZ=100
var __aAQi=-200
var tempo=-1
var __VH3w=0.0
var __3YB7=0
var __C_xz=[]
var __y14C=0
var __Sylt=0
var __UUGQ
var __rlil=0
var __NA5C=false
var __DJ8D=0.25
var __pRTt=false
func __hbwA(__cl3k):
	if __ZYST and $Notes/KrisNotes.get_children().size()==0:
		if __EYht==false:
			__Sylt=100*float(__ld2j)/float(__ld2j+GlobalVariables.__QUav)
			__xqjS()
			$Target/Black.scale=$Target/ScoreScreenBlack.scale
			$Target/TargetL.visible=false
			$Target/TargetR.visible=false
			$Stage/ComboNumber.visible=false
			$Stage/ComboText.visible=false
			$Target/ScoreScreenText.visible_ratio=0
			__EYht=true
			var __Z1g6=""
			if __K1_Y:
				__Z1g6+="New High Score!: "+str(int(GlobalVariables.__C3dv))+"\n"
			else:
				__Z1g6+="Score: "+str(int(GlobalVariables.__C3dv))+"\n"
			__Z1g6+="Notes Hit: "+str(__ld2j)+"\n"
			__Z1g6+="Notes Missed: "+str(GlobalVariables.__QUav)+"\n"
			__Z1g6+="Percentage Hit: "+str(snapped(__Sylt,0.01))+"%"
			$Target/ScoreScreenText.text=__Z1g6
		__27Ye+=__cl3k*2
		if __27Ye>1:__27Ye=1
		$Target/Black.scale.x=lerp(__DsGk,$Target/ScoreScreenBlack.scale.x,__27Ye)
		if $Target/Black.scale.x==$Target/ScoreScreenBlack.scale.x:
			__v5NY+=__cl3k*2
			if __v5NY>1:__v5NY=1
			$Target/ScoreScreenText.visible_ratio=lerp(0,1,__v5NY)
		$Target/ReturnToMenuPrompt.visible=true
		$MapNameText.visible_ratio+=__cl3k
		$MapIDText.visible_ratio+=__cl3k
		if Input.is_action_just_pressed("QuitMap"):
			if GlobalVariables.__4orA:GlobalVariables.__jkDc()
			__7GAk()
var __cQEI=0.0
func __jqsQ(__hVaI,__Fs9M):
	if(__hVaI['subtype']==MIDI_MESSAGE_NOTE_ON):
		var ___geC
		var __nTbO=GlobalVariables.__GVAR+__7QCr
		match __hVaI['note']:
			GlobalVariables.__OxNx.__lnUc:
				___geC=__tsDo.instantiate()
				___geC.__vQS1B="L"
				___geC.position=__U1AR+Vector2(0,__nTbO)
				___geC.modulate=__dPLh
				___geC.visible=false
				$Notes/KrisNotes.add_child(___geC)
			GlobalVariables.__OxNx.__Ok5c:
				___geC=__tsDo.instantiate()
				___geC.__vQS1B="R"
				___geC.position=__U1AR+Vector2(__E3EG,0)+Vector2(0,__nTbO)
				___geC.modulate=__GFh4
				___geC.visible=false
				$Notes/KrisNotes.add_child(___geC)
			GlobalVariables.__OxNx.__Eti0,GlobalVariables.__OxNx.__Hu24:
				__C_xz.push_back(Vector4(__U1AR.y+__nTbO,__U1AR.y+__nTbO,0,1))
			GlobalVariables.__OxNx.__WhQo,GlobalVariables.__OxNx.__tDhu:
				__C_xz.push_back(Vector4(__U1AR.y+__nTbO,__U1AR.y+__nTbO,1,1))
	elif(__hVaI['subtype']==MIDI_MESSAGE_NOTE_OFF):
			match __hVaI['note']:
				GlobalVariables.__OxNx.__Eti0,GlobalVariables.__OxNx.__Hu24:
					__C_xz[__C_xz.rfind_custom(__i4Qf.bind())].w=0
				GlobalVariables.__OxNx.__WhQo,GlobalVariables.__OxNx.__tDhu:
					__C_xz[__C_xz.rfind_custom(__cn1_.bind())].w=0
var __cxCu=[0.0,0.0]
var __qRiE=20
var __9F1_ 
var __M8t7=false
var __taNO=[]
func __KuUR(__iPyl,__eEqL):
	var __rnKq=$MidiPlayer.midi
	if __U1AR.y+GlobalVariables.__GVAR+__7QCr>80 and GlobalVariables.__B2cY==false:
		$LagWarning.visible=true
		GlobalVariables.__B2cY=true
	var __6tu4
	var __h5Kj=GlobalVariables.__GVAR+__7QCr
	if(__iPyl['subtype']==MIDI_MESSAGE_NOTE_ON):
		match __iPyl['note']:
			GlobalVariables.__OxNx.__lnUc:
				__6tu4=__tsDo.instantiate()
				__6tu4.__vQS1B="L"
				__6tu4.position=__U1AR+Vector2(0,__h5Kj)
				__6tu4.modulate=__dPLh
				__6tu4.visible=false
				$Notes/KrisNotes.add_child(__6tu4)
			GlobalVariables.__OxNx.__Ok5c:
				__6tu4=__tsDo.instantiate()
				__6tu4.__vQS1B="R"
				__6tu4.position=__U1AR+Vector2(__E3EG,0)+Vector2(0,__h5Kj)
				__6tu4.modulate=__GFh4
				__6tu4.visible=false
				$Notes/KrisNotes.add_child(__6tu4)
			GlobalVariables.__OxNx.__Eti0,GlobalVariables.__OxNx.__Hu24:
				__C_xz.push_back(Vector4(__U1AR.y+__h5Kj,__U1AR.y+__h5Kj,0,1))
			GlobalVariables.__OxNx.__WhQo,GlobalVariables.__OxNx.__tDhu:
				__C_xz.push_back(Vector4(__U1AR.y+__h5Kj,__U1AR.y+__h5Kj,1,1))
			GlobalVariables.__OxNx.__pxdo:
				__6tu4=__tsDo.instantiate()
				__6tu4.__vQS1B="L"
				__6tu4.__Nv5i=GlobalVariables.__OxNx.__pxdo
				__6tu4.position=__U1AR+Vector2(0,__h5Kj)+Vector2(-192,0)
				__6tu4.modulate=__dPLh
				__6tu4.visible=__v8qe 
				$Notes/SusieNotes.add_child(__6tu4)
			GlobalVariables.__OxNx.__X13L:
				__6tu4=__tsDo.instantiate()
				__6tu4.__vQS1B="R"
				__6tu4.__Nv5i=GlobalVariables.__OxNx.__X13L
				__6tu4.position=__U1AR+Vector2(__E3EG,__h5Kj)+Vector2(-192,0)
				__6tu4.modulate=__GFh4
				__6tu4.visible=__v8qe 
				$Notes/SusieNotes.add_child(__6tu4)
			GlobalVariables.__OxNx.__uG3Y:
				__6tu4=__tsDo.instantiate()
				__6tu4.__vQS1B="B"
				__6tu4.__Nv5i=GlobalVariables.__OxNx.__uG3Y
				__6tu4.position=__U1AR+Vector2(__E3EG/2,__h5Kj)+Vector2(-192,0)
				__6tu4.scale=__6tu4.scale*Vector2(4,0.5)
				__6tu4.modulate=Color(1,1,1,0.5)
				__6tu4.visible=__v8qe 
				$Notes/SusieNotes.add_child(__6tu4)
			GlobalVariables.__OxNx.__aIOK:
				__6tu4=__tsDo.instantiate()
				__6tu4.__vQS1B="B"
				__6tu4.__Nv5i=GlobalVariables.__OxNx.__aIOK
				__6tu4.position=__U1AR+Vector2(0,__h5Kj)+Vector2(189,0)
				__6tu4.scale=__6tu4.scale*Vector2(0.5,1)
				__6tu4.modulate=Color(1,1,1,1)
				__6tu4.visible=__ORad 
				$Notes/RalseiNotes.add_child(__6tu4)
			GlobalVariables.__OxNx.__Wjmg:
				__6tu4=__tsDo.instantiate()
				__6tu4.__vQS1B="B"
				__6tu4.__Nv5i=GlobalVariables.__OxNx.__Wjmg
				__6tu4.position=__U1AR+Vector2(__E3EG/2,__h5Kj)+Vector2(189,0)
				__6tu4.scale=__6tu4.scale*Vector2(0.5,1)
				__6tu4.modulate=Color(1,1,1,1)
				__6tu4.visible=__ORad 
				$Notes/RalseiNotes.add_child(__6tu4)
			GlobalVariables.__OxNx.__kmKG:
				__6tu4=__tsDo.instantiate()
				__6tu4.__vQS1B="B"
				__6tu4.__Nv5i=GlobalVariables.__OxNx.__kmKG
				__6tu4.position=__U1AR+Vector2(__E3EG,__h5Kj)+Vector2(189,0)
				__6tu4.scale=__6tu4.scale*Vector2(0.5,1)
				__6tu4.modulate=Color(1,1,1,1)
				__6tu4.visible=__ORad 
				$Notes/RalseiNotes.add_child(__6tu4)
			GlobalVariables.__OxNx.__CSyO:
				__6tu4=__tsDo.instantiate()
				__6tu4.__vQS1B="Anim"
				__6tu4.__Nv5i=GlobalVariables.__OxNx.__CSyO
				__6tu4.position=__U1AR+Vector2(__E3EG,__h5Kj)+Vector2(289,0)
				__6tu4.scale=__6tu4.scale*Vector2(0.5,1)
				__6tu4.modulate=Color(1,1,1,0.5)
				__6tu4.visible=__D54l 
				$Notes/RalseiAnimNotes.add_child(__6tu4)
	elif(__iPyl['subtype']==MIDI_MESSAGE_NOTE_OFF):
			match __iPyl['note']:
				GlobalVariables.__OxNx.__Eti0,GlobalVariables.__OxNx.__Hu24:
					__C_xz[__C_xz.rfind_custom(__i4Qf.bind())].w=0
				GlobalVariables.__OxNx.__WhQo,GlobalVariables.__OxNx.__tDhu:
					__C_xz[__C_xz.rfind_custom(__cn1_.bind())].w=0
				GlobalVariables.__OxNx.__aIOK:
					__6tu4=__tsDo.instantiate()
					__6tu4.__vQS1B="B"
					__6tu4.__Nv5i=GlobalVariables.__OxNx.__aIOK
					__6tu4.position=__U1AR+Vector2(0,__h5Kj)+Vector2(189,0)
					__6tu4.scale=__6tu4.scale*Vector2(0.5,1)
					__6tu4.modulate=Color(1,1,1,0.5)
					__6tu4.__fbAq=false
					__6tu4.visible=__ORad 
					$Notes/RalseiNotes.add_child(__6tu4)
				GlobalVariables.__OxNx.__Wjmg:
					__6tu4=__tsDo.instantiate()
					__6tu4.__vQS1B="B"
					__6tu4.__Nv5i=GlobalVariables.__OxNx.__Wjmg
					__6tu4.position=__U1AR+Vector2(__E3EG/2,__h5Kj)+Vector2(189,0)
					__6tu4.scale=__6tu4.scale*Vector2(0.5,1)
					__6tu4.modulate=Color(1,1,1,0.5)
					__6tu4.__fbAq=false
					__6tu4.visible=__ORad 
					$Notes/RalseiNotes.add_child(__6tu4)
				GlobalVariables.__OxNx.__kmKG:
					__6tu4=__tsDo.instantiate()
					__6tu4.__vQS1B="B"
					__6tu4.__Nv5i=GlobalVariables.__OxNx.__kmKG
					__6tu4.position=__U1AR+Vector2(__E3EG,__h5Kj)+Vector2(189,0)
					__6tu4.scale=__6tu4.scale*Vector2(0.5,1)
					__6tu4.modulate=Color(1,1,1,0.5)
					__6tu4.__fbAq=false
					__6tu4.visible=__ORad 
					$Notes/RalseiNotes.add_child(__6tu4)
var __fAo6=0.0
var __4RxL=false
