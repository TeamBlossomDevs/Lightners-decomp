@tool
@icon("icon.svg")
extends Node
class_name __18Wg
signal file_selected(__YMO1:__T0zE)
func _notification(__5WuB):
	if __5WuB==NOTIFICATION_PREDELETE:
		if __6ZCW:
			__6ZCW.deregister_dialog(get_instance_id())
func _ready():
	if Engine.is_editor_hint():
		update_configuration_warnings()
	if __dJCB:
		JavaScriptBridge.eval(__2uOg)
		__6ZCW=JavaScriptBridge.get_interface('html5filedialoginterface')
		__XuOa=JavaScriptBridge.create_callback(__CQKG)
		__6ZCW.register_dialog(get_instance_id(),FileMode.keys()[file_mode],','.join(filters),__XuOa)
signal __Sqsj(__pCzt:Array[__T0zE])
signal files_selected(__Bjlr:Array[__T0zE])
signal dir_selected(__psWU:Array[__T0zE])
enum FileMode{
	__EXcp,
	__o2Ns,
	__Zbwx,
	__QKqY,
}
func _get_configuration_warnings()->PackedStringArray:
	var __WIwE:Array=[]
	if OS.get_name()!='Web':
		__WIwE.append("This node only works on web exports! Calling its functions in a regular build will result in failed assertions")
	__WIwE.append("This node's attributes must not be changed after _ready() is called")
	return __WIwE
signal __FDA0()
func __CQKG(__pXiV):
	var __OYck:Array[__T0zE]=[]
	for __UHGP in __pXiV:
		__OYck.append(__T0zE.new(__UHGP))
	match file_mode:
		FileMode.__EXcp:
			file_selected.emit(__OYck[0])
		FileMode.__o2Ns:
			files_selected.emit(__OYck)
		FileMode.__Zbwx:
			dir_selected.emit(__OYck)
		FileMode.__QKqY:
			__Sqsj.emit(__OYck)
	__Tbvr.emit(__OYck)
@export var file_mode:FileMode=FileMode.__EXcp
var __6ZCW:JavaScriptObject
var __dJCB:bool=OS.get_name()=='Web'
@export var filters:PackedStringArray=[]
signal __Tbvr(__2N8f:Array[__18Wg])
func show():
	assert(__dJCB,"HTML5FileDialog node only works in web exports!")
	assert(is_node_ready(),"HTML5FileDialog cannot be shown before its _ready! did you forget to call add_child()?")
	assert(__6ZCW!=null,"HTML5FileDialog JS interface is null! This is probably a bug, please report it at https://gitlab.com/mocchapi/godot-4-html5-file-dialogs/-/issues")
	__6ZCW.prompt_dialog(get_instance_id())
	__FDA0.emit()
const __2uOg:="""
if (window.html5filedialoginterface == null) {
	window.html5filedialoginterface = {
		callbacks: {},
		buffers: {},

		register_dialog: function(id, FileMode, filter, callback) {
			let root = document.getElementsByTagName('body')[0];
			let input = document.createElement("input");

			input.setAttribute('id','html5filedialog-'+id);
			input.setAttribute('type','file');
			input.setAttribute('style','display: none;');
			input.setAttribute('data-id', ''+id);

			if (FileMode == "__Zbwx" || FileMode == "__QKqY") {
				input.setAttribute("directory", 'true');
				input.setAttribute('webkitdirectory','true');
			}

			if (FileMode == "__QKqY" || FileMode == "__o2Ns") {
				input.setAttribute('multiple','true');
			}
			
			if (filter != "") {
				input.setAttribute('accept',filter)
			}
		
			input.addEventListener('change', window.html5filedialoginterface.onchanged)
			window.html5filedialoginterface.callbacks[''+id] = callback;
			root.appendChild(input);
			
			console.log("__18Wg:registered dialog "+id);
			
			return id;
		},

		deregister_dialog: function(id) {
			let input = document.getElementById('html5filedialog-'+id);
			if (input != null) {
				console.log("__18Wg:deregistering "+id);
				input.remove();
			} else {
				console.log("__18Wg:ERROR,attempted to deregister non-existing dialog "+id);
			}
		},
 
		prompt_dialog: function(id) {
			console.log("__18Wg:opening dialog for __Tzl5__18Wg:change event for __MQ3x""
var __XuOa:JavaScriptObject
