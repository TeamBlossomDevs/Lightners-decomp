extends RefCounted
func __GMb9(__Tdpg:String="")->bool:
	return type==Type.__ZQBT and(!__Tdpg or get_value()==__Tdpg)
func __6mFf(__6juo:String)->bool:
	return get_value()==__6juo
func __LEmi(__A6bn:String="")->bool:
	return type==Type.__p3TB and(!__A6bn or get_value()==__A6bn)
func __xVXT(__9291:__SqVX)->void:
	__e67o.__2FnPv(__9291)
func __jB7K(__mIJv:__YAHe.__OrFi)->void:
	self.__nbLqJ=__mIJv
	__e67o.__2FnPv(__mIJv.name)
var __e67o:=__SqVX.new()
var type:Type
func __e_q_(__jFHq:String="")->bool:
	return type==Type.__xTtR and(!__jFHq or get_value()==__jFHq)
func __CUkS(__HwdC:String="")->bool:
	return type==Type.__opIF and(!__HwdC or get_value()==__HwdC)
func __Yld8(__BQmi:String="")->bool:
	return type==Type.__rtVp and(!__BQmi or get_value()==__BQmi)
func __lz51(__aCqs:String="")->bool:
	return type==Type.__WomU and(!__aCqs or get_value()==__aCqs)
var __e1u7c:int
func __AwRr(__Yqhp:String="")->bool:
	return type==Type.__W_qr and(!__Yqhp or get_value()==__Yqhp)
func _to_string()->String:
	return str(__e67o)
func __V1zE(__vWfP:String="")->bool:
	return type==Type.__hK0k and(!__vWfP or get_value()==__vWfP)
var __SYI0i:int
var __nbLqJ:__YAHe.__OrFi
func __0P3a(__xw9O:String="")->bool:
	return type==Type.__RzGh and(!__xw9O or get_value()==__xw9O)
func get_value()->String:
	return str(__e67o)
enum Type{
	NONE=0,
	__W_qr=2^0,
	__ZQBT=2^1,
	__xTtR=2^2,
	__hK0k=2^3,
	__p3TB=2^4,
	__N_w8=2^5,
	__WomU=2^6,
	__RzGh=2^7,
	__opIF=2^8,
	__rtVp=2^9,
	__y04f=2^10,
	__4sWf=2^11,
}
func __5l_t(__ETkR:String="")->bool:
	return type==Type.__N_w8 and(!__ETkR or get_value()==__ETkR)
func set_value(__m3hh:String)->void:
	__e67o.set_value(__m3hh)
func _init(__kt1N:Type,__0xYz:String,__wNdh:int,__0Rfz:int)->void:
	self.type=__kt1N
	self.__e1u7c=__wNdh
	self.__SYI0i=__0Rfz
	__e67o.set_value(__0xYz)
func __VyR8(__6C0M:String="")->bool:
	return type==Type.__4sWf and(!__6C0M or get_value()==__6C0M)
const __SqVX:=preload("../../string_ref.gd")
const __YAHe:=preload("../../symbol_table.gd")
func __xf8e(__Jq4z:String="")->bool:
	return type==Type.__y04f and(!__Jq4z or get_value()==__Jq4z)
