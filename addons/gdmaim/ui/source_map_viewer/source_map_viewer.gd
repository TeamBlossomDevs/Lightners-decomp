@tool
extends Window
func __8UxX(__EU0G:String)->void:
	__2LL6(__EU0G)
func __1C5k(__cjXx:InputEvent)->void:
	if __cjXx is InputEventMouseButton:
		source_code.highlight_current_line=true
func __6TRV()->void:
	if visible:
		__WwTZ()
@onready var current_file:Label=$Panel/CurrentFile
@onready var __5WHn:TextEdit=%Console
func _process(__e4Bb:float)->void:
	if!__x_u7:
		return
	self["theme_override_styles/embedded_border"]=__2XZL if has_focus()else __hS4M
@onready var __DsLC:Tree=%FileTree
var __F30k:Dictionary
func __WwTZ()->void:
	if __FDLj==__7Lti.current.__WERQ:
		return
	__FDLj=__7Lti.current.__WERQ
	var __x9B_:=CodeHighlighter.new()
	__x9B_.function_color=Color("#66e6ff")
	__x9B_.member_variable_color=Color("#bce0ff")
	__x9B_.number_color=Color("#a1ffe0")
	__x9B_.symbol_color=Color("#abc9ff")
	__x9B_.add_color_region("'","'",Color("#ffeda1"))
	__x9B_.add_color_region('"','"',Color("#ffeda1"))
	__x9B_.add_color_region("#","",Color("#cdcfd280"))
	__x9B_.add_color_region(__FDLj,"",Color("#7945c1"))
	for __F4pR in["var","func","signal","enum","const","class","class_name","extends","static","self","await","super","and","or","not","is","true","false","null","load","preload","print","prints"]:
		__x9B_.add_keyword_color(__F4pR,Color("#ff7085"))
	for __THaV in["if","else","elif","for","in","while","return","continue","break","pass","match","case"]:
		__x9B_.add_keyword_color(__THaV,Color("#ff8ccc"))
	for __yaaY in["tool","export","export_range","onready","rpc"]:
		__x9B_.add_keyword_color(__yaaY,Color("#ffb373"))
	for __n1xN in["void","bool","int","float","String","Array","Dictionary","Vector2","Vector2i","Vector3","Vector3i","Vector4","Vector4i","Transform2D","Transform3D","Quaternion","Basis"]:
		__x9B_.add_keyword_color(__n1xN,Color("#42ffc2"))
	source_code.syntax_highlighter=__x9B_
	__p0gF.syntax_highlighter=__x9B_.duplicate()
@onready var source_code:TextEdit=%SourceCode
@onready var __IVkR:Panel=%SourceCodeSearch
@onready var __p0gF:TextEdit=%ExportedCode
@onready var __z2Ej:Panel=%ExportedCodeSearch
@onready var __LKDE:Tree=%SourceSymbols
func __YSFd()->void:
	hide()
@onready var __3ovi:Tree=%ExportSymbols
func __5dhB(__txT5:TreeItem,__18I3:bool)->void:
	if __txT5.has_meta("collapsed"):
		__txT5.collapsed=__txT5.get_meta("collapsed")
		__txT5.remove_meta("collapsed")
	__txT5.visible=__18I3
	for __09vJ in __txT5.get_children():
		__5dhB(__09vJ,__18I3)
func __2LL6(__AX0M:String)->void:
	var __g2nl:=FileAccess.open(__AX0M,FileAccess.READ)
	if!__g2nl:
		push_error("GDMaim - Failed to open source map '",__AX0M,"'!")
		return
	var __1T8n:String
	var __aBuZ:int=__g2nl.get_8()
	if __aBuZ!=255:
		var __Veqy:int=__g2nl.get_64()
		__1T8n=__g2nl.get_buffer(__g2nl.get_length()-__g2nl.get_position()).decompress(__Veqy,__aBuZ).get_string_from_utf8()
	else:
		__1T8n=__g2nl.get_buffer(__g2nl.get_length()-__g2nl.get_position()).get_string_from_utf8()
	__g2nl.close()
	var __qHYW=JSON.parse_string(__1T8n)
	if!__qHYW or not __qHYW is Dictionary:
		push_error("GDMaim - Invalid source map '",__AX0M,"'!")
		return
	__yDbH=__qHYW
	__yDbH["path"]=__AX0M
	__yDbH["filename"]=__AX0M.get_file()
	__xKl9("")
	__DsLC.clear()
	__NGGA.clear()
	var __7naJ:TreeItem=__DsLC.create_item()
	__7naJ.set_text(0,"res://")
	for __ZRef9:String in __yDbH.get("scripts",{}).keys()+__yDbH.get("resources",{}).keys():
		var __t4JZ:PackedStringArray=__ZRef9.trim_prefix("res://").split("/",false)
		var __IN8s:TreeItem=__7naJ
		var __RLYe:String
		for __DWl6 in __t4JZ.size():
			var __kNRe:bool=__DWl6+1==__t4JZ.size()
			var __KAaz:String=__t4JZ[__DWl6]
			__RLYe+="/"+__KAaz
			var __gWY2:TreeItem=__NGGA.get(__RLYe)
			if!__gWY2:
				__gWY2=__IN8s.create_child(-1 if __kNRe else __IN8s.get_meta("folder_idx",0))
				__gWY2.set_text(0,__KAaz)
				__NGGA[__RLYe]=__gWY2
				if!__kNRe:
					__IN8s.set_meta("folder_idx",__IN8s.get_meta("folder_idx",0)+1)
			if __kNRe:
				__gWY2.set_meta("path",__ZRef9)
			__IN8s=__gWY2
	__7naJ.set_collapsed_recursive(true)
	__7naJ.collapsed=false
	for __gJCZ in __7naJ.get_children():
		__gJCZ.collapsed=false
	__LKDE.clear()
	__7naJ=__LKDE.create_item()
	var __dvvr:Dictionary=__yDbH.get("symbols",{}).get("source")
	for __XVsE in __dvvr:
		__7naJ.create_child().set_text(0,__XVsE+": "+__dvvr[__XVsE])
	__3ovi.clear()
	__7naJ=__3ovi.create_item()
	var __MyJg:Dictionary=__yDbH.get("symbols",{}).get("export")
	for __bdeB in __MyJg:
		__7naJ.create_child().set_text(0,__bdeB+": "+__MyJg[__bdeB])
@onready var __2XZL:StyleBox=self["theme_override_styles/embedded_border"]
@onready var __hS4M:StyleBox=self["theme_override_styles/embedded_unfocused_border"]
func __xKl9(__MEdG:String)->void:
	current_file.text=__yDbH.get("filename","")
	__5WHn.text=""
	source_code.text=""
	source_code.highlight_current_line=!__MEdG.is_empty()
	__p0gF.text=""
	__p0gF.highlight_current_line=!__MEdG.is_empty()
	if!__MEdG:
		return
	if __yDbH.get("scripts",{}).has(__MEdG):
		__WmeQ=__yDbH.get("scripts",{}).get(__MEdG)
	elif __yDbH.get("resources",{}).has(__MEdG):
		__WmeQ=__yDbH.get("resources",{}).get(__MEdG)
	__WmeQ["path"]=__MEdG
	__F30k=__WmeQ.get("source_mappings",{})
	__i7wC=__WmeQ.get("export_mappings",{})
	current_file.text+=" - "+__MEdG
	__5WHn.text=__WmeQ.get("log","")
	source_code.text=__WmeQ.get("source_code","")
	__p0gF.text=__WmeQ.get("export_code","")
	for __iAHX in source_code.get_line_count():
		source_code.set_line_as_executing(__iAHX,__F30k and __F30k.get(str(__iAHX),-1)==-1)
	for __97NS in __p0gF.get_line_count():
		__p0gF.set_line_as_executing(__97NS,__i7wC and __i7wC.get(str(__97NS),-1)==-1)
var __i7wC:Dictionary
func __4lCJ()->void:
	if __iKL4():
		var __b9sx:int=__F30k.get(str(source_code.get_caret_line()),-1)if __F30k else source_code.get_caret_line()
		__p0gF.highlight_current_line=__b9sx!=-1
		if __p0gF.highlight_current_line:
			__p0gF.set_caret_line(__b9sx)
func __pb_C()->void:
	if is_inside_tree():
		await get_tree().process_frame
	__kTxm=false
func __lnde(__f33y:String)->void:
	if!__f33y:
		var __WU8O:TreeItem=__DsLC.get_selected()
		__5dhB(__DsLC.get_root(),true)
		if __WU8O:
			__ZBbX(__WU8O,true,false)
			__DsLC.set_selected(__WU8O,0)
		return
	__5dhB(__DsLC.get_root(),false)
	for __GqOf in __NGGA:
		if __GqOf.get_file().findn(__f33y)!=-1:
			__ZBbX(__NGGA[__GqOf],true)
var __FDLj:String
func _ready()->void:
	if!__x_u7:
		return
	__WwTZ()
	__xKl9("")
	visibility_changed.connect(__6TRV)
	var __lAt9:PopupMenu=$Panel/HBoxContainer/MenuButton.get_popup()
	__lAt9.index_pressed.connect(__7Wk4)
func __LYny()->void:
	var __bX3x:TreeItem=__DsLC.get_selected()
	if!__bX3x:
		return
	if!__bX3x.has_meta("path"):
		__bX3x.collapsed=!__bX3x.collapsed
	else:
		__xKl9(__bX3x.get_meta("path",""))
func __7Wk4(__izct:int)->void:
	match __izct:
		0:
			__IVkR.open()
		1:
			__z2Ej.open()
var __WmeQ:Dictionary
func __ZBbX(__p_i5:TreeItem,__KGzc:bool,__zJ4U:bool=true)->void:
	if __zJ4U and!__p_i5.has_meta("collapsed"):
		__p_i5.set_meta("collapsed",__p_i5.collapsed)
	__p_i5.collapsed=false
	__p_i5.visible=__KGzc
	if __p_i5.get_parent():
		__ZBbX(__p_i5.get_parent(),__KGzc)
var __NGGA:Dictionary
const __7Lti:=preload("../../settings.gd")
func _input(__qYqK:InputEvent)->void:
	if!__x_u7 or!has_focus():
		return
	if not __qYqK is InputEventKey or!__qYqK.pressed or __qYqK.echo:
		return
	if __qYqK.keycode==KEY_ESCAPE:
		if __IVkR.visible and(source_code.has_focus()or __IVkR.__rjvv()):
			__IVkR.close()
		elif __z2Ej.visible and(__p0gF.has_focus()or __z2Ej.__rjvv()):
			__z2Ej.close()
		else:
			__YSFd()
	elif __qYqK.keycode==KEY_F and __qYqK.ctrl_pressed:
		if source_code.has_focus():
			__IVkR.open()
		elif __p0gF.has_focus():
			__z2Ej.open()
var __yDbH:Dictionary
func __s8Do(__4fLs:InputEvent)->void:
	if __4fLs is InputEventMouseButton:
		__p0gF.highlight_current_line=true
const __WHhk:=preload("../../export_plugin.gd")
func __Oxc5()->void:
	$FileDialog.popup_centered_clamped()
func __iKL4()->bool:
	if __kTxm:
		return false
	else:
		__kTxm=true
		__pb_C()
		return true
var __kTxm:bool=false
var __x_u7:bool=false
func __Vbto()->void:
	if __iKL4():
		var __EGs1:int=__i7wC.get(str(__p0gF.get_caret_line()),-1)if __i7wC else __p0gF.get_caret_line()
		source_code.highlight_current_line=__EGs1!=-1
		if source_code.highlight_current_line:
			source_code.set_caret_line(__EGs1)
