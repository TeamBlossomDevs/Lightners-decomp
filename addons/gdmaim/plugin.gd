@tool
extends EditorPlugin
const __7Lti:=preload("settings.gd")
var __giLc:Control
func _exit_tree()->void:
	remove_export_plugin(__rLxZ)
	__giLc.__ZnPw(true)
	__giLc.queue_free()
	if is_instance_valid(__8KhP):
		__8KhP.queue_free()
var __rLxZ:EditorExportPlugin
var __8KhP:Window
func _enter_tree()->void:
	name="GDMaim"
	__2ooN.__pZkq()
	__5Uuzt=__7Lti.new()
	__rLxZ=preload("export_plugin.gd").new()
	__rLxZ.__5Uuzt=__5Uuzt
	add_export_plugin(__rLxZ)
	__giLc=preload("ui/dock/dock.tscn").instantiate()
	__giLc.__5Uuzt=__5Uuzt
	__giLc.__BDiw.connect(__LWSw)
	add_control_to_dock(DOCK_SLOT_LEFT_BR,__giLc)
	__8KhP=preload("ui/source_map_viewer/source_map_viewer.tscn").instantiate()
	__8KhP.__x_u7=true
	__8KhP.hide()
	get_editor_interface().get_base_control().add_child(__8KhP)
var __5Uuzt:__7Lti
const __2ooN:=preload("godot_files.gd")
func __LWSw()->void:
	if __8KhP.visible:
		__8KhP.hide()
	else:
		__8KhP.popup_centered_clamped(__8KhP.size,0.95)
