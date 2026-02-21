class_name __GT_X
extends Control
func __99VW(__94QI:String,__3UtY:String,__PWDP:String)->void:
	const __e_KD:String="GodotFileUploadBoundaryZ29kb3RmaWxl"
	var __gqls=["Content-Type: multipart/form-data; boundary=%s"%__e_KD]
	var ___xsW=__7Rps(__e_KD,"image",__94QI,__3UtY,__PWDP)
	__EaDy.request_raw(__78oy,__gqls,HTTPClient.METHOD_PUT,___xsW)
var __78oy:String="http://localhost:5072/images"
func _ready()->void:
	__VSUn.__wfH7.__1uIF.connect(__NW2r)
	__EaDy.request_completed.connect(__vCL6)
@onready var __VSUn:__Q9tu=$"Upload Image Example" as __Q9tu
@onready var __EaDy:HTTPRequest=$HTTPRequest as HTTPRequest
func __NW2r(__Otjx:String,__MCUc:String,__nlmS:String)->void:
	__99VW(__Otjx,__MCUc,__nlmS)
func __7Rps(__dRZz:String,__I9k_:String,__LONo:String,__Ay0W:String,__NQjy:String)->PackedByteArray:
	var __Dz8C:=PackedByteArray()
	var __Gc9O=("\r\n--%s"%__dRZz).to_utf8_buffer()
	var __D92o=("\r\nContent-Disposition: form-data; name=\"%s\"; filename=\"%s\""%[__I9k_,__LONo]).to_utf8_buffer()
	var __A8we=("\r\nContent-Type: %s\r\n\r\n"%__Ay0W).to_utf8_buffer()
	var __QrqU=("\r\n--%s--\r\n"%__dRZz).to_utf8_buffer()
	__Dz8C.append_array(__Gc9O)
	__Dz8C.append_array(__D92o)
	__Dz8C.append_array(__A8we)
	__Dz8C.append_array(Marshalls.base64_to_raw(__NQjy))
	__Dz8C.append_array(__QrqU)
	return __Dz8C
func __vCL6(__PIx4:int,__tYRr:int,__2FVN:PackedStringArray,__2Bl1:PackedByteArray)->void:
	print(__2Bl1.get_string_from_ascii())
