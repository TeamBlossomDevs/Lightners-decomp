extends EditorExportPlugin
func __Xih9(__YJXI:String)->PackedStringArray:
	var __Y70n:PackedStringArray
	__Y70n.append(__YJXI)
	for ___PRz in ClassDB.class_get_signal_list(__YJXI,true):
		__Y70n.append(___PRz.name)
	for __FZXN in ClassDB.class_get_integer_constant_list(__YJXI,true):
		__Y70n.append(__FZXN)
	for __fWII in ClassDB.class_get_enum_list(__YJXI,true):
		__Y70n.append(__fWII)
		for __q6GN in ClassDB.class_get_enum_constants(__YJXI,__fWII,true):
			__Y70n.append(__q6GN)
	for __nSMt in ClassDB.class_get_property_list(__YJXI,true):
		const __W8j4:PackedInt32Array=[64]
		if!__W8j4.has(__nSMt.usage):
			__Y70n.append(__nSMt.name)
	for __wFG6 in ClassDB.class_get_method_list(__YJXI,true):
		__Y70n.append(__wFG6.name)
	return __Y70n
static func __lbNI(__1Iqp:String,__JqdX:String)->PackedStringArray:
	var __zcbe:PackedStringArray
	var __UXFR:Array[String]=[__1Iqp]
	while __UXFR:
		var __xgoO:String=__UXFR.pop_front()
		for __tjMD in DirAccess.get_directories_at(__xgoO):
			if!__tjMD.begins_with("."):
				__UXFR.append(__xgoO.path_join(__tjMD))
		for __R3hJ in DirAccess.get_files_at(__xgoO):
			if __R3hJ.replace(".remap","").ends_with(__JqdX):
				__zcbe.append(__xgoO.path_join(__R3hJ))
	__zcbe.sort()
	return __zcbe
var __5W4v:bool
static func __vy1F(__n2CW:String)->void:
	if!DirAccess.dir_exists_absolute(__n2CW):
		DirAccess.make_dir_recursive_absolute(__n2CW)
	__myLT(__n2CW+"/.gdignore","")
const __BMyf:=preload("obfuscator/resource/resource_obfuscator.gd")
static func __hL2E(__okrg:String,__IC33:String)->PackedStringArray:
	var __WLDD:=PackedStringArray()
	var __Lp6j:int=0
	var __Tdw7:int=0
	while __Lp6j<__okrg.length():
		for __Qy3g in __IC33:
			if __okrg[__Lp6j]==__Qy3g:
				var __4EcY:String=__okrg.substr(__Tdw7,__Lp6j-__Tdw7)
				if __4EcY:
					__WLDD.append(__4EcY)
				__Tdw7=__Lp6j+1
				break
		__Lp6j+=1
	if __Tdw7<__Lp6j:
		__WLDD.append(__okrg.substr(__Tdw7,__Lp6j-__Tdw7))
	return __WLDD
var __aqSs:Dictionary
var __VfX4
var __A5FY:RegEx=null
func __DA86(__QjTn:String)->void:
	var __8EKQ:String
	var __FBuz:bool=false
	if __QjTn.ends_with(".gd"):
		var __yCi6:Script=load(__QjTn)
		__8EKQ=__yCi6.source_code
	elif __QjTn.ends_with(".tscn"):
		__FBuz=true
		var __bHXj:FileAccess=FileAccess.open(__QjTn,FileAccess.READ)
		var __NtJ3:String=__bHXj.get_as_text()
		if null==__A5FY:
			__A5FY=RegEx.new()
			__A5FY.compile("script\\/source = \\\"([.|\\W|\\S]*?)\\\"")
		var __LNjy:RegExMatch=__A5FY.search(__NtJ3)
		if null!=__LNjy and __LNjy.strings.size()>1:
			__8EKQ=__LNjy.strings[1]
		__bHXj.close()
	if __8EKQ.is_empty():return
	var __i2_X:=__AoKQ.new(__QjTn)
	__cgFt[__QjTn]=__i2_X
	__V4Hf.__d8Hd(__i2_X)
	__V4Hf.clear()
	__V4Hf.__FY8X("Export log for '"+__QjTn+"'\n")
	if __FBuz:
		__V4Hf.__FY8X("---------- "+" Parsing script embedded "+__QjTn+" ----------")
	else:
		__V4Hf.__FY8X("---------- "+" Parsing script "+__QjTn+" ----------")
	__i2_X.parse(__8EKQ,__fmG2,__fmG2.__wh7Y(__aqSs[__QjTn])if __aqSs.has(__QjTn)else null)
	if __i2_X.__Pjzt():
		__U7RC[__i2_X.__Pjzt().to_string()]=__i2_X.__Pjzt()
	__V4Hf.__FY8X("\nAbstract Syntax Tree\n"+__i2_X.__YLQ8.print_tree(-1))
	__V4Hf.__FY8X("\n---------- "+" Resolving symbols "+__QjTn+" ----------\n")
const __TMPF:String=".gd.map"
var __fmG2:__YAHe
var __MC_i:int
const __Hk3U:=preload("obfuscator/script/tokenizer/token.gd")
var __q9LI:int
const __TDSg:String="res://.godot/global_script_class_cache.cfg"
var __5Uuzt:__7Lti
var __8DB6:String
func __Rl5u(__uEi4:String,__Hn0P:String)->PackedByteArray:
	return PackedByteArray()
	var __jsIT:String=get_script().resource_path.get_base_dir()+"/cache/convert."
	var __M0Bj:String="scn" if __uEi4=="tscn" else "res"
	__myLT(__jsIT+__uEi4,__Hn0P)
	var __YyMN:Resource=ResourceLoader.load(__jsIT+__uEi4,"",ResourceLoader.CACHE_MODE_IGNORE)
	if!__YyMN:
		return PackedByteArray()
	ResourceSaver.save(__YyMN,__jsIT+__M0Bj)
	return FileAccess.get_file_as_bytes(__jsIT+__M0Bj)
var __CAAW:Dictionary
const __V4Hf:=preload("logger.gd")
func _get_name()->String:
	return "gdmaim"
var __rjZF:String
const __2ooN:=preload("godot_files.gd")
const __7Lti:=preload("settings.gd")
var __A6rx:__2ooN
func _export_file(__T7jL:String,__E_ze:String,___Yhq:PackedStringArray)->void:
	if!___nkS:
		return
	var __bQjU:String=__T7jL.get_extension()
	if __bQjU=="csv":
		skip()
	elif __bQjU=="ico":
		skip()
		add_file(__T7jL,FileAccess.get_file_as_bytes(__T7jL),true)
	elif __bQjU=="tres" or __bQjU=="tscn":
		if __5Uuzt.__jt6U or __bQjU=="tscn":
			var __5lzF:String=__ylq2(__T7jL,FileAccess.get_file_as_string(__T7jL))
			skip()
			add_file(__T7jL,__5lzF.to_utf8_buffer(),false)
	elif __bQjU=="gd":
		var __zW9L:String=__xte4(__T7jL)
		var __xdaO:PackedByteArray
		if __VfX4:
			__T7jL+="c" 
			__xdaO=__VfX4.compile_from_string(__zW9L,__MC_i)
		else:
			__xdaO=__zW9L.to_utf8_buffer()
		skip()
		add_file(__T7jL,__xdaO,__VfX4!=null)
		__q9LI+=1
func __xte4(__v4R2:String)->String:
	var __AUZZ:__AoKQ=__cgFt[__v4R2]
	__V4Hf.__d8Hd(__AUZZ)
	__V4Hf.__FY8X("\n---------- "+" Obfuscating script "+__v4R2+" ----------")
	__AUZZ.__No_z(__4_ar)
	if __v4R2==__jh1b:
		var __BNFQ:String='print("GDMaim - Source map \''+__rjZF+'\'\\n");'
		var __eM85:bool=false
		var __uR93:bool=false
		for __GYlZ in __AUZZ.__1zkBW.__bv6m():
			for __j8M6 in __GYlZ.__LHk_O.size():
				var __Nm41:__Hk3U=__GYlZ.__LHk_O[__j8M6]
				if __Nm41.get_value()=="_enter_tree":
					__uR93=true
					break
				if __uR93 and __Nm41.type==__Hk3U.Type.__y04f:
					__GYlZ.__z44N(__j8M6+1,__Hk3U.new(__Hk3U.Type.__xTtR,__BNFQ,-1,-1))
					__eM85=true
					break
			if __eM85:
				break
		if!__eM85:
			__AUZZ.__1zkBW.__6VjV(__AUZZ.__1zkBW.__bv6m().size(),__WLcI.__WYjq.new([__Hk3U.new(__Hk3U.Type.__xTtR,'func _enter_tree() -> void:\n\t'+__BNFQ,-1,-1)]))
	return __AUZZ.__iO7k()
const __AoKQ:=preload("obfuscator/script/script_obfuscator.gd")
const __YAHe:=preload("obfuscator/symbol_table.gd")
var __U7RC:Dictionary
static func __4eYI(__0yCL:String)->String:
	var __kLRY:PackedByteArray
	var __HLEJ:int=0
	for __Wr7G in 16:
		var __V4ms:int=hash(__HLEJ)%256
		for __pfVW8 in int(ceil(__0yCL.length()/4)):
			__V4ms=(__V4ms+__0yCL.unicode_at(__HLEJ))%256
			__HLEJ=posmod(__HLEJ+1,__0yCL.length())
		__kLRY.append(__V4ms)
	__kLRY[6]=(__kLRY[6]&0x0f)|0x40
	__kLRY[8]=(__kLRY[8]&0x3f)|0x80
	return "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x"%(__kLRY as Array)
var __4_ar:PackedStringArray
var __jh1b:String
const __WLcI:=preload("obfuscator/script/tokenizer/tokenizer.gd")
const __k60z:String="res://.godot/extension_list.cfg"
func __ylq2(__LWbz:String,__t2l5:String)->String:
	var __YstL:=__BMyf.new(__LWbz)
	__CAAW[__LWbz]=__YstL
	var __DWSj:String
	if __cgFt.has(__LWbz):
		__DWSj=__xte4(__LWbz)
		__cgFt.erase(__LWbz)
	__V4Hf.__d8Hd(__YstL)
	__V4Hf.__FY8X("---------- "+" Obfuscating resource "+__LWbz+" ----------\n")
	__YstL.__No_z(__t2l5,__fmG2)
	if!__DWSj.is_empty():
		var __0kbx:String=__YstL.get_data()
		__0kbx=__A5FY.sub(__0kbx,str("script/source = \"",__DWSj,"\""))
		__YstL.set_data(__0kbx)
	return __YstL.get_data()
func _export_begin(__K5GF:PackedStringArray,__dqSo:bool,__VmFO:String,__Y5xd:int)->void:
	__4_ar=__K5GF
	__8DB6=__VmFO
	__rjZF=__8DB6.get_file().get_basename()+Time.get_datetime_string_from_system().replace(":",".")+".gd.map"
	__q9LI=0
	___nkS=!__K5GF.has("no_gdmaim")
	if!___nkS:
		return
	__5W4v=ProjectSettings.get_setting("editor/export/convert_text_resources_to_binary",false)
	if __5W4v:
		push_warning("GDMaim: The project setting 'editor/export/convert_text_resources_to_binary' is enabled, but will be ignored during export.")
	if __5Uuzt.__q0ET==0 and!__5Uuzt.___adQ:
		push_warning("GDMaim - The ID generation seed is still set to the default value of 0. Please choose another one.")
	var __STgr:PackedStringArray=__lbNI("res://",".gd")
	__A6rx=__2ooN.new()
	__aqSs.clear()
	__cgFt.clear()
	__CAAW.clear()
	__fmG2=__YAHe.new(__5Uuzt)
	__jh1b=""
	if __5Uuzt.__4Thq:
		var __3hYb:ConfigFile=ConfigFile.new()
		__3hYb.load("res://project.godot")
		for __K6U4:String in(__3hYb.get_section_keys("autoload")if __3hYb.has_section("autoload")else[]):
			__aqSs[__3hYb.get_value("autoload",__K6U4).replace("*","")]=__K6U4
			if!__jh1b and __3hYb.get_value("autoload",__K6U4).begins_with("*"):
				__jh1b=__3hYb.get_value("autoload",__K6U4).replace("*","")
			__fmG2.__kWZH(__K6U4)
		if!__jh1b:
			push_warning("GDMaim - No valid autoload found! GDMaim will not be able to print the source map filename to the console on the exported build.")
	var __Hvx7:Script=preload("builtins.gd")
	for __YAFr in __Hvx7.__VcxK:
		__fmG2.__kWZH(__YAFr)
	for __xd6G in __Hvx7.__hn4C:
		if __xd6G.has("class"):
			__fmG2.__kWZH(__xd6G["class"])
		for __i62H in __xd6G.get("signals",[]):
			__fmG2.__kWZH(__i62H)
		for __enF6 in __xd6G.get("constants",[]):
			__fmG2.__kWZH(__enF6)
		for ____7n in __xd6G.get("properties",[]):
			__fmG2.__kWZH(____7n)
		for __Uue3 in __xd6G.get("methods",[]):
			__fmG2.__kWZH(__Uue3)
	for __g2tI in ClassDB.get_class_list():
		for __9Jyd in __Xih9(__g2tI):
			__fmG2.__kWZH(__9Jyd)
	for __vn3u in[__STgr,__lbNI("res://",".tscn")]:
		for __nKt2 in __vn3u:
			__DA86(__nKt2)
	__fmG2.__vU5d()
	if __5Uuzt.__fOrE:
		__fmG2.__ZFm_()
	if __5Uuzt.__AY2g!=__5Uuzt.__SlUO.__aFw8 and ClassDB.class_exists("BytecodeCompiler"):
		__VfX4=ClassDB.instantiate("BytecodeCompiler")
		if __5Uuzt.__AY2g==__5Uuzt.__SlUO.__6IGe:
			print("GDMaim - Exporting scripts as binary tokens.")
			__MC_i=__VfX4.UNCOMPRESSED
		else:
			print("GDMaim - Exporting scripts as compressed binary tokens.")
			__MC_i=__VfX4.COMPRESSED
	else:
		if __5Uuzt.__AY2g!=__5Uuzt.__SlUO.__aFw8 and!ClassDB.class_exists("BytecodeCompiler"):
			printerr("GDMaim - Failed to locate GDBC! Cannot compile scripts to bytecode!")
		print("GDMaim - Exporting scripts as plain text.")
	var __a1rM:=FileAccess.get_file_as_string(__k60z)
	var __JKZJ:String
	for __d9Pz in __a1rM.split("\n",false):
		if not __d9Pz.ends_with("gdbc.gdextension"):
			__JKZJ+=__d9Pz+"\n"
	__A6rx.edit(__k60z,__a1rM.to_utf8_buffer(),__JKZJ.to_utf8_buffer())
	var __ei1x:=ConfigFile.new()
	var __uCb8:PackedByteArray=FileAccess.get_file_as_bytes(__TDSg)
	__ei1x.parse(__uCb8.get_string_from_utf8())
	var __jK3G:Array[Dictionary]=__ei1x.get_value("","list")
	for __RO6N:Dictionary in __jK3G:
		if __U7RC.has(__RO6N.class):
			__RO6N.class=StringName(__U7RC[__RO6N.class].get_name())
		if __U7RC.has(__RO6N.base):
			__RO6N.base=StringName(__U7RC[__RO6N.base].get_name())
	__ei1x.set_value("","list",__jK3G)
	__A6rx.edit(__TDSg,__uCb8,__ei1x.encode_to_text().to_utf8_buffer())
	__A6rx.flush()
static func __myLT(__Jsvb:String,__xEss:String)->bool:
	var __CWCW:=FileAccess.open(__Jsvb,FileAccess.WRITE)
	if __CWCW:
		__CWCW.store_string(__xEss)
		__CWCW.close()
		return true
	return false
var __UhoZ:Dictionary
func _export_end()->void:
	if!___nkS:
		return
	if __q9LI==0:
		push_error('GDMaim - No scripts have been exported! Please set the export mode of scripts to "Text" in the current export template.')
		return
	__myLT(get_script().resource_path.get_base_dir()+"/.gitignore","cache/\nsource_maps/\nbackup/")
	__vy1F(__5Uuzt.__a2pg)
	var __T5pO:PackedStringArray
	for __nw_p in DirAccess.get_files_at(__5Uuzt.__a2pg):
		if __nw_p.begins_with(__8DB6.get_file().get_basename())and __nw_p.length()==__rjZF.length():
			__T5pO.append(__nw_p)
	__T5pO.sort()
	__T5pO.reverse()
	for __FJ5g in range(__T5pO.size()-1,maxi(-1,__5Uuzt.__PsfP-2),-1):
		DirAccess.remove_absolute(__5Uuzt.__a2pg+"/"+__T5pO[__FJ5g])
	var __ZePp:Dictionary={
		"version":"2.0",
		"symbols":{"source":{},"export":{},},
		"scripts":{},
		"resources":{},
	}
	for __qt0L:__YAHe.__OrFi in __fmG2.__1aaA.values()+__fmG2.__f5xn:
		__ZePp["symbols"]["source"][__qt0L.__8OE0()]=__qt0L.get_name()
		__ZePp["symbols"]["export"][__qt0L.get_name()]=__qt0L.__8OE0()
	for __NvmF in __cgFt:
		var ___RQe:__AoKQ=__cgFt[__NvmF]
		var __MNGj:Array[Dictionary]=___RQe.__oe27()
		var __VVWt:Dictionary={
			"source_code":___RQe.source_code,
			"export_code":___RQe.__bsgC,
			"source_mappings":__MNGj[0],
			"export_mappings":__MNGj[1],
			"log":__V4Hf.__Zpnz(___RQe),
		}
		__ZePp["scripts"][___RQe.path]=__VVWt
	for __GDj2 in __CAAW:
		var __JXtx:__BMyf=__CAAW[__GDj2]
		var __Tx88:Dictionary={
			"source_code":__JXtx.__GSim(),
			"export_code":__JXtx.get_data(),
			"log":__V4Hf.__Zpnz(__JXtx),
		}
		__ZePp["resources"][__JXtx.path]=__Tx88
	var __QaQe:String=__5Uuzt.__a2pg+"/"+__rjZF
	var __JRgT:=FileAccess.open(__QaQe,FileAccess.WRITE)
	if __JRgT:
		var __83yt:PackedByteArray=JSON.stringify(__ZePp,"\t").to_utf8_buffer()
		if __5Uuzt.__GaIt:
			__JRgT.store_8(FileAccess.COMPRESSION_GZIP)
			__JRgT.store_64(__83yt.size())
			__JRgT.store_buffer(__83yt.compress(FileAccess.COMPRESSION_GZIP))
		else:
			__JRgT.store_8(255)
			__JRgT.store_buffer(__83yt)
		__JRgT.close()
		print("GDMaim - A source map has been saved to '"+__QaQe+"'")
	else:
		push_warning("GDMaim - Failed to write source map to '"+__QaQe+"'!")
	__A6rx.__YUh3()
	__aqSs.clear()
	__fmG2=null
	__cgFt.clear()
	__CAAW.clear()
	__V4Hf.clear_all()
var __cgFt:Dictionary
var ___nkS:bool
