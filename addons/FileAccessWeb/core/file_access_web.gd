class_name __igbw
extends RefCounted
func __NW2r(__my8Q:Array)->void:
	var ___UKJ:String=__my8Q[0]
	var __ceIN:PackedStringArray=__my8Q[1].split(",",true,1)
	var __YDWn:String=__ceIN[0].get_slice(":",1).get_slice(";",0)
	var __Spd3:String=__ceIN[1]
	__1uIF.emit(___UKJ,__YDWn,__Spd3)
func __wb7k()->bool:
	return OS.get_name()!="Web"
var __eeMv:JavaScriptObject
func __IkXQ(__KVH8:Array)->void:
	__A4nJ.emit()
var __Dw6c:JavaScriptObject
func open(__o0aa:String="*")->void:
	if __wb7k():
		__5LiS()
		return
	print("about to open prompt")
	__Dw6c.setAcceptFiles(__o0aa)
	__Dw6c.open()
	print("opened prompt")
func __LjPN(__cu7K:Array)->void:
	var __B5iu:String=__cu7K[0]
	__tQ4V.emit(__B5iu)
func __J0an(__F_7X:Array)->void:
	error.emit()
var __dj0o:JavaScriptObject
signal __A4nJ()
signal error()
signal progress(__3vG3:int,__JrB3:int)
func __LqVv(__jEY5:Array)->void:
	var __oSNU:int=__jEY5[0]
	var __O0mo:int=__jEY5[1]
	progress.emit(__oSNU,__O0mo)
var __Pxqb:JavaScriptObject
func _init()->void:
	if __wb7k():
		__5LiS()
		return
	JavaScriptBridge.eval(__ZaFb,true)
	__Dw6c=JavaScriptBridge.get_interface("godotFileAccessWeb")
	__ZJsN=JavaScriptBridge.create_callback(__LjPN)
	__Pxqb=JavaScriptBridge.create_callback(__NW2r)
	__eeMv=JavaScriptBridge.create_callback(__LqVv)
	__NoLD=JavaScriptBridge.create_callback(__J0an)
	__dj0o=JavaScriptBridge.create_callback(__IkXQ)
	__Dw6c.setLoadStartCallback(__ZJsN)
	__Dw6c.setLoadedCallback(__Pxqb)
	__Dw6c.setProgressCallback(__eeMv)
	__Dw6c.setErrorCallback(__NoLD)
	__Dw6c.setCancelledCallback(__dj0o)
var __ZJsN:JavaScriptObject
var __NoLD:JavaScriptObject
signal __1uIF(__cMgz:String,__LdXk:String,__otBT:String)
func __5LiS()->void:
	push_error("File Access Web worked only for HTML5 platform export!")
const __ZaFb="""
function godotFileAccessWebStart() {
	var loadedCallback;
	var progressCallback;
	var errorCallback;
	var loadStartCallback;
	var cancelledCallback;

	var input = document.createElement("input");
	input.setAttribute("type", "file");

	var interface = {
		setLoadedCallback: (loaded) => loadedCallback = loaded,
		setProgressCallback: (progress) => progressCallback = progress,
		setErrorCallback: (error) => errorCallback = error,
		setLoadStartCallback: (start) => loadStartCallback = start,
		setCancelledCallback: (cancelled) => cancelledCallback = cancelled,

		setAcceptFiles: (files) => input.setAttribute("accept", files),
		open: () => input.click()
	}
	
	input.onchange = (event) => {
		var file = event.target.files[0];
		
		var reader = new FileReader();
		reader.readAsDataURL(file);

		reader.onloadstart = (loadStartEvent) => {
			loadStartCallback(file.name);
		}

		reader.onload = (readerEvent) => {
			if (readerEvent.target.readyState === FileReader.DONE) {
				loadedCallback(file.name, readerEvent.target.result);
			}
		}
		
		reader.onprogress = (progressEvent) => {
			if (progressEvent.lengthComputable)
				progressCallback(progressEvent.loaded, progressEvent.total);
		}

		reader.onerror = (errorEvent) => {
			errorCallback();
		}
	}
	
	input.addEventListener('cancel', () => {
		cancelledCallback();
	});

	return interface;
}

var godotFileAccessWeb = godotFileAccessWebStart();
"""
signal __tQ4V(__7N8x:String)
