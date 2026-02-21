class_name __94gx
extends Control
@onready var __eq3b:Button=%"Upload Button" as Button
@onready var progress:ProgressBar=%"Progress Bar" as ProgressBar
@onready var __w4yr:Label=%"Success Label" as Label
func __gTRK()->void:
	push_error("Error!")
func __hGyM()->void:
	__wfH7.open()
func __VNZO(__NLPj:int,__ymjH:int)->void:
	var __yyxr:float=float(__NLPj)/float(__ymjH)*100
	progress.value=__yyxr
	print(str(__yyxr)+"%")
func __NW2r(__Lb48:String,__6vom:String,__8qpw:String)->void:
	progress.visible=false
	__w4yr.visible=true
	__w4yr.text="File loaded: "+__Lb48
	$"Window Background/Label".text="data: "+__8qpw
	print("file is called: "+__Lb48)
	var __TAGd=Marshalls.base64_to_raw(__8qpw)
	print("Turned to PackedByteArray, size is  : "+str(__TAGd.size()))
var __wfH7:__igbw=__igbw.new()
func __qpup(__L1Og:String)->void:
	progress.visible=true
	__w4yr.visible=false
func _ready()->void:
	__eq3b.pressed.connect(__hGyM)
	__wfH7.__tQ4V.connect(__qpup)
	__wfH7.__1uIF.connect(__NW2r)
	__wfH7.progress.connect(__VNZO)
	__wfH7.error.connect(__gTRK)
