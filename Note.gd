extends Node2D
func _process(__W_mi):
	if __U6Ua==false:
		position.y+=GlobalVariables.__fRk1*__W_mi
	elif __U6Ua==true:
		if GlobalVariables.__4orA==false:position.y=270
		__thb0+=__W_mi
		modulate=Color(10,2,2)
		modulate.a=lerp(0.8,0.0,__thb0*(1/__zXyD))
		scale.x=lerp(1.0,1.5,__thb0*(1/__zXyD))
		scale.y=scale.x
		if __thb0>__zXyD:
			queue_free()
	if position.y>318:
		GlobalVariables.__ZErl=0
		GlobalVariables.__QUav+=1
		queue_free()
var __Nv5i
var __zXyD=0.2
var __thb0=0
var __fbAq=true
var __vQS1B=""
var __U6Ua=false
