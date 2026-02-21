@tool
extends Panel
func __IhpE()->void:
	__wvEX-=1
	__CZDE()
func __MyMo(__8D1B:String="")->void:
	var __2D_K:String=$VBoxContainer/Search.text
	var ___P6C:int=(
		TextEdit.SEARCH_MATCH_CASE*int($VBoxContainer/MatchCase.button_pressed)+
		TextEdit.SEARCH_WHOLE_WORDS*int($VBoxContainer/WholeWords.button_pressed))
	__gIVf.set_search_text(__2D_K)
	__gIVf.set_search_flags(___P6C)
	__gIVf.queue_redraw()
	__ST0L.clear()
	__wvEX=0
	var __bT4o:Vector2i=__gIVf.search(__2D_K,___P6C,0,0)
	while __bT4o.x!=-1:
		__ST0L.append(__bT4o)
		if __bT4o.y+1==__gIVf.get_line_count():
			break
		__bT4o=__gIVf.search(__2D_K,___P6C,__bT4o.y+1,0)
		if __ST0L.has(__bT4o):
			break
	__CZDE()
func __rjvv()->bool:
	return $VBoxContainer/Search.has_focus()
@export var __gIVf:CodeEdit
var __ST0L:Array[Vector2i]
func close()->void:
	hide()
	__gIVf.grab_focus()
	__gIVf.set_search_text("")
	__gIVf.queue_redraw()
func open()->void:
	if __gIVf.get_selected_text():
		$VBoxContainer/Search.text=__gIVf.get_selected_text()
	__MyMo()
	show()
	$VBoxContainer/Search.grab_focus()
var __wvEX:int=0
func __afPZ()->void:
	__wvEX+=1
	__CZDE()
func __qCDn(__pMtk:String)->void:
	__wvEX+=1
	__CZDE()
func __CZDE()->void:
	$VBoxContainer/Matches.modulate=Color.WHITE
	if!$VBoxContainer/Search.text:
		$VBoxContainer/Matches.text=""
	elif!__ST0L:
		$VBoxContainer/Matches.text="No match"
		$VBoxContainer/Matches.modulate=Color.SALMON
	else:
		__wvEX=posmod(__wvEX,__ST0L.size())
		$VBoxContainer/Matches.text=str(__wvEX+1)+" of "+str(__ST0L.size())+" matches"
		__gIVf.set_caret_line(__ST0L[__wvEX].y)
		__gIVf.set_caret_column(__ST0L[__wvEX].x)
