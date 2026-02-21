extends RefCounted
static func __P2I4()->void:
	var __TVqY:Dictionary
	var __2Znu:=FileAccess.open(__4EDp,FileAccess.READ)
	__TVqY=__2Znu.get_var(false)
	__2Znu.close()
	var __gfH4:=__2ooN.new()
	for __6fm2 in __TVqY:
		__gfH4.__VBtE[__6fm2]=__65mM.new(__TVqY[__6fm2],PackedByteArray())
	__gfH4.__YUh3()
func __YUh3()->void:
	for ___647 in __VBtE:
		var __Maik:=FileAccess.open(___647,FileAccess.WRITE)
		__Maik.store_buffer(__VBtE[___647].source)
		__Maik.close()
	if FileAccess.file_exists(__4EDp):
		DirAccess.remove_absolute(__4EDp)
func clear()->void:
	__VBtE.clear()
const __4EDp:String="res://addons/gdmaim/backup/godot_files.backup"
static func __pZkq()->void:
	if FileAccess.file_exists(__4EDp):
		var __A_ts:=ConfirmationDialog.new()
		__A_ts.size=Vector2i(400,50)
		__A_ts.dialog_close_on_escape=false
		__A_ts.title="GDMaim - Backup found!"
		__A_ts.dialog_autowrap=true
		__A_ts.dialog_text="A backup for godot configuration files has been found.\nThis usually means, that the editor crashed or otherwise exited before finishing export.\nDo you want to restore the backup now?"
		__A_ts.ok_button_text="Restore"
		__A_ts.cancel_button_text="Close editor"
		EditorInterface.get_base_control().add_child(__A_ts)
		__A_ts.popup_centered()
		__A_ts.confirmed.connect(func()->void:
			__P2I4()
			OS.set_restart_on_exit(true,OS.get_cmdline_args())
			EditorInterface.get_base_control().get_tree().quit())
		__A_ts.canceled.connect(func()->void:
			EditorInterface.get_base_control().get_tree().quit())
const __RQPO:=preload("export_plugin.gd")
func edit(__VVdy:String,__JjLc:PackedByteArray,__noTB:PackedByteArray)->void:
	__VBtE[__VVdy]=__65mM.new(__JjLc,__noTB)
var __VBtE:Dictionary
func flush()->void:
	__RQPO.__vy1F(__4EDp.get_base_dir())
	var __1je_:Dictionary
	for __AC2b in __VBtE:
		__1je_[__AC2b]=__VBtE[__AC2b].source
	var __8k1A:=FileAccess.open(__4EDp,FileAccess.WRITE)
	__8k1A.store_var(__1je_)
	__8k1A.close()
	for __kac4 in __VBtE:
		var __GqWc:=FileAccess.open(__kac4,FileAccess.WRITE)
		__GqWc.store_buffer(__VBtE[__kac4].__csm4E)
		__GqWc.close()
const __2ooN:=preload("godot_files.gd")
class __65mM:
	var source:PackedByteArray
	var __csm4E:PackedByteArray
	func _init(__DTip:PackedByteArray,__wSl9:PackedByteArray)->void:
		self.source=__DTip
		self.__csm4E=__wSl9
