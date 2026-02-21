@tool
extends Panel
var __wPPP:Array[Node]
const __7Lti:=preload("../../settings.gd")
func __Snxm(__j4hi:int)->void:
	__ZnPw()
var __5Uuzt:__7Lti
func __dEb0(__RnIO:bool)->void:
	__ZnPw()
func __cB6q(__flxt:float)->void:
	__ZnPw()
func _ready()->void:
	if!__5Uuzt:
		return
	for __gzi2 in __5Uuzt.__sBoj():
		var __aGZs:Label=preload("dock_category.tscn").instantiate()
		__aGZs.text=__gzi2.__QUA1_
		$ScrollContainer/VBoxContainer.add_child(__aGZs)
		for __IAwB in __gzi2.__gBjB:
			if __IAwB.__QUA1_:
				__aGZs=preload("dock_entry.tscn").instantiate()
				__aGZs.text=__IAwB.__QUA1_
				if __IAwB.__QUA1_:
					__aGZs.tooltip_text=__IAwB.__QUA1_+"\n"+__IAwB.tooltip
				$ScrollContainer/VBoxContainer.add_child(__aGZs)
			if __IAwB.__FINZ1!=__IAwB.__KqX9.NONE:
				match __IAwB.__FINZ1:
					__IAwB.__KqX9.__tzSW:
						var __zohK:OptionButton=preload("dock_options.tscn").instantiate()
						__zohK.__cWe_=__IAwB.__Jm_Wf
						__zohK.disabled=__IAwB.disabled
						for __ZdwL in __IAwB.__H80lt:
							__zohK.add_item(__ZdwL)
						__zohK.item_selected.connect(__Snxm)
						__aGZs.add_child(__zohK)
						__iI0M(__zohK)
			else:
				match typeof(__5Uuzt.get(__IAwB.__Jm_Wf)):
					TYPE_BOOL:
						var __UCHh:CheckBox=preload("dock_checkbox.tscn").instantiate()
						__UCHh.__cWe_=__IAwB.__Jm_Wf
						__UCHh.disabled=__IAwB.disabled
						__UCHh.toggled.connect(__dEb0)
						__aGZs.add_child(__UCHh)
						__iI0M(__UCHh)
					TYPE_INT:
						var __P62c:SpinBox=preload("dock_spinbox.tscn").instantiate()
						__P62c.__cWe_=__IAwB.__Jm_Wf
						__P62c.editable=!__IAwB.disabled
						__P62c.value_changed.connect(__cB6q)
						__aGZs.add_child(__P62c)
						__iI0M(__P62c)
					TYPE_STRING:
						var __pvZF:LineEdit=preload("dock_lineedit.tscn").instantiate()
						__pvZF.__cWe_=__IAwB.__Jm_Wf
						__pvZF.editable=!__IAwB.disabled
						__pvZF.text_changed.connect(__egfa)
						if __IAwB.__QUA1_:
							__aGZs.add_child(__pvZF)
						else:
							$ScrollContainer/VBoxContainer.add_child(__pvZF)
							__pvZF.position=Vector2(0.0,-4.0)
							__pvZF.set_anchors_preset(Control.PRESET_HCENTER_WIDE)
							__pvZF.placeholder_text=__IAwB.tooltip
						__iI0M(__pvZF)
func __egfa(__bW0E:String)->void:
	__ZnPw()
func __Jkgz()->void:
	__BDiw.emit()
func __iI0M(__Dol7:Node)->void:
	__wPPP.append(__Dol7)
	__Dol7.__e_5c(__5Uuzt)
func __ZnPw(__po36:bool=false)->void:
	if(___2YO and!__po36):
		return
	___2YO=true
	await get_tree().process_frame
	for __rlRe in __wPPP:
		__rlRe.__w_0x()
	__5Uuzt.__w_0x()
	___2YO=false
var ___2YO:bool=false
signal __BDiw()
