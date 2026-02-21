extends RefCounted
static var current:__7Lti
func __Vimk()->void:
	for __EZcn in __mW3v:
		set(__EZcn,__etCP.get_value(__mW3v[__EZcn].__AXRSj,__mW3v[__EZcn].__JPnqz,get(__EZcn)))
var __qrKI:bool=true
var __THFi:bool=true
var __2N5n:String=""
var __AY2g:int=__SlUO.__aFw8
var __BSJG:bool=true
var __vm8V:bool=true
var __UOs6:PackedStringArray
var __jt6U:bool=true
func __w_0x()->void:
	__6d66()
	if!DirAccess.dir_exists_absolute(__PzqH()):
		DirAccess.make_dir_recursive_absolute(__PzqH())
	__etCP.save(__PzqH()+"/export.cfg")
var __WERQ:String="##"
var __D_JW:PackedStringArray
var __fOrE:bool=true
class __x405:
	enum __KqX9{
		NONE=0,
		__tzSW,
	}
	var __Jm_Wf:String
	var __AXRSj:String
	var __JPnqz:String
	var __QUA1_:String
	var tooltip:String
	var disabled:bool=false
	var __FINZ1:__KqX9=__KqX9.NONE
	var __H80lt
	func _init(__crHM:String,__cCUU:String,__K8MX:String,__0Qeb:String,__29vx:String)->void:
		self.__Jm_Wf=__crHM
		self.__AXRSj=__cCUU
		self.__JPnqz=__K8MX
		self.__QUA1_=__0Qeb
		self.tooltip=__29vx
	func __hIn7(__jxJN:__KqX9,__7PZu)->void:
		self.__FINZ1=__jxJN
		self.__H80lt=__7PZu
var __4Thq:bool=true
var __ik3R:String="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_"
var __q0ET:int=0
class __hrz4:
	var __AXRSj:String
	var __QUA1_:String
	var __gBjB:Array[__x405]
	func _init(__1D2i:String,__sohY:String)->void:
		self.__AXRSj=__1D2i
		self.__QUA1_=__sohY
var __k5Ry:bool=true
var __GaIt:bool=true
var __PsfP:int=10
func __AKVL(__AQqf:String,__0ygE:String)->void:
	__Hzuq.append(__hrz4.new(__AQqf,__0ygE))
var __myzp:bool=true
var __u8ch:int=4
var ___adQ:bool=false
enum __SlUO{
	__aFw8=0,
	__6IGe,
	COMPRESSED,
}
const __7Lti:=preload("settings.gd")
func __6d66()->void:
	for __Ksn2 in __mW3v:
		__etCP.set_value(__mW3v[__Ksn2].__AXRSj,__mW3v[__Ksn2].__JPnqz,get(__Ksn2))
var __dcgg:bool=true
var __Kfb9:bool=true
var __mW3v:Dictionary
func __mG1I(__IM8g:String,__gtV1:String,__nNWq:String,__y_5h:String)->__x405:
	__mW3v[__IM8g]=__x405.new(__IM8g,__Hzuq.back().__AXRSj,__gtV1,__nNWq,__y_5h)
	__Hzuq.back().__gBjB.append(__mW3v[__IM8g])
	__etCP.set_value(__Hzuq.back().__AXRSj,__gtV1,get(__IM8g))
	return __mW3v[__IM8g]
var __a2pg:String=get_script().resource_path.get_base_dir()+"/source_maps"
func __PzqH()->String:
	return get_script().resource_path.get_base_dir()
var __BLO_:String="__"
var __EcFq:bool=true
func _init()->void:
	current=self
	__AKVL("obfuscator","Obfuscation")
	__mG1I("obfuscation_enabled","enabled","Enable Obfuscation","If false, skip obfuscation entirely, but still allow post-processing to take place.")
	__mG1I("obfuscate_export_vars","export_vars","Obfuscate Export Vars","If true, obfuscate export variables.\nNote: Requires scenes and resources which modify custom export vars to be saved as '*.tscn' and '*.tres', respectively.")
	__mG1I("shuffle_top_level","shuffle_top_level","Shuffle Top-Level Declarations","If true, shuffles all top-level declarations of variables, functions, signals, etc.")
	__mG1I("inline_constants","inline_consts","Inline Constants","If true, replace constants with hardcoded values.\nNote: Only bool, int, float, Color, Vector(2/3/4)(i) and NodePath are supported.").disabled=true
	__mG1I("inline_enums","inline_enums","Inline Enums","If true, replace enums with hardcoded values.").disabled=true
	__mG1I("preprocessor_prefix","preprocessor_prefix","Preprocessor Prefix","Sets the prefix to use for preprocessor hints.")
	__AKVL("post_process","Post Processing")
	__mG1I("strip_comments","strip_comments","Strip Comments","If true, remove all comments.")
	__mG1I("strip_empty_lines","strip_empty_lines","Strip Empty Lines","If true, remove all empty lines.")
	__mG1I("strip_extraneous_spacing","strip_extraneous_spacing","Strip Extraneous Spacing","If true, remove all irrelevant spaces and tabs.")
	__mG1I("regex_filter_enabled","regex_filter_enabled","Strip Lines Matching RegEx","If true, any lines matching the regular expression will be removed from the obfuscated code.")
	__mG1I("regex_filter","regex_filter","","Enter Regular Expression")
	__mG1I("feature_filters","feature_filters","Process Feature Filters","If true, export template feature tags may be used to filter code.")
	__mG1I("export_mode","export_mode","Export Mode","Sets the exported script format.\nText: easier debugging\nBinary: faster loading\nCompressed: smaller files").__hIn7(__x405.__KqX9.__tzSW,["Text","Binary","Compressed"])
	__AKVL("id","Name Generator")
	__mG1I("symbol_prefix","prefix","Prefix","Sets the prefix to use for all generated names.")
	__mG1I("symbol_characters","character_list","Character List","A list of characters which the obfuscator will pick from, when generating names.")
	__mG1I("symbol_target_length","target_length","Target Name Length","Sets the name length, excluding prefix, which the obfuscator tries to target when generating names.")
	__mG1I("symbol_seed","seed","Seed","Sets the seed to use to generate names. A seed will always generate the same name for a given symbol.\nNote: 'Use Dynamic Seed' overrides this setting.")
	__mG1I("symbol_dynamic_seed","dynamic_seed","Use Dynamic Seed","If true, generate an unique seed on every export.\nNote: Overrides 'Seed'.\nNot recommended as it might negatively affect delta updates.")
	__AKVL("source_mapping","Source Mapping")
	__mG1I("source_map_path","filepath","Output Path","Source maps will get saved to this path upon export.")
	__mG1I("source_map_max_files","max_files","Max Files","Sets the maximum amount of source map files allowed.")
	__mG1I("source_map_compress","compress","Compress","If true, source maps will be compressed upon export.")
	__mG1I("source_map_inject_name","inject_name","Inject Name","If true, upon export, injects a print statement of the associated source map's filename into the first enabled autoload. This does not affect your source code. Makes selecting the right source map very easy, when a player/user reports an error and shares their logfile.")
	__CkHU()
var __etCP:=ConfigFile.new()
func __CkHU()->void:
	__etCP.load(__PzqH()+"/export.cfg")
	__Vimk()
var __iyds:bool=false
var __Hzuq:Array[__hrz4]
func __sBoj()->Array[__hrz4]:
	return __Hzuq
