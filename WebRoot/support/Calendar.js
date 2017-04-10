



var buttonStyle		="background-color: #FFF7E7;border:1px solid #78acff;font-size:12.8px;cursor:hand;font-size: 9pt;";//按钮的Css

function createCalendar(){
var days=new Array("日","一","二","三","四","五","六")		
function calendar(){
	var today       = new Date()
	
	this.todayDay   = today.getDate();		
	this.todayMonth = today.getMonth();
	this.todayYear  = today.getFullYear();
	
	this.activeCellIndex=0;
	
}
	_calendarControl = new calendar();
	var tmpHTML="<div id=\"CalendarControl\">";
	tmpHTML+="<table border=1 width=100% cellspacing=0 cellpadding=0 >";		
	
	tmpHTML+="<tr valign=top>";
	tmpHTML+="<td>";
	tmpHTML+="<table width=100% cellspacing=0 cellpadding=0 style=\"font-size: 9pt; font-weight:bold;border=0;background-color:#C8E3FF;\">";
	tmpHTML+="<tr>";
	tmpHTML+="<td align=left>";
	tmpHTML+="<input type=button style='font-family: webdings;"+buttonStyle+"' value=7 title=\"上一年\" onclick=\"calendar_dateChange(_calendarControl.year-1,_calendarControl.month)\">";
	tmpHTML+="<input type=button style='font-family: webdings;"+buttonStyle+"' value=3 title=\"上个月\" onclick=\"calendar_dateChange(_calendarControl.preYear,_calendarControl.preMonth)\">";

	tmpHTML+="</td>";	
	tmpHTML+="<td align=left id=\"yearValue\">";
	tmpHTML+="</td>";
	tmpHTML+="<td align=right id=\"monthValue\">";
	tmpHTML+="</td>";
	tmpHTML+="<td align=right>";
	tmpHTML+="<input type=button style='font-family: webdings;"+buttonStyle+"' value=4 title=\"下个月\" onclick=\"calendar_dateChange(_calendarControl.nextYear,_calendarControl.nextMonth)\">";
	tmpHTML+="<input type=button style='font-family: webdings;"+buttonStyle+"' value=8 title=\"下一年\"  onclick=\"calendar_dateChange(_calendarControl.year+1,_calendarControl.month)\">";

	tmpHTML+="</tr>";	
	tmpHTML+="</table>";	
	tmpHTML+="</td>";
	tmpHTML+="</tr>";
	tmpHTML+="<tr >";
	tmpHTML+="<td>";
	tmpHTML+="<table width=100% cellspacing=0 cellpadding=0 id=\"calendarweek\" style=\"font-size: 9pt; font-weight:bold;background-color:#0080FF;color:#FFFFFF;\">";
	tmpHTML+="<tr>";
	for (var i=0;i<=6;i++){
		tmpHTML+="<td width=14% align=center>"+days[i]+"</td>";
	}		
	tmpHTML+="</tr>";
	tmpHTML+="</table>";
	tmpHTML+="</td>";
	tmpHTML+="</tr>";
	
	tmpHTML+="<tr >";
	tmpHTML+="<td>";
	tmpHTML+="<table border=1 height=100% id=\"calendarData\"  width=100% cellspacing=2 cellpadding=2 style=\"font-size: 9pt; border=0;cursor: hand\"";
	tmpHTML+="onclick=\"calendar_cellClick(event.srcElement)\">";
	
	for(var i=0;i<=5;i++){
		tmpHTML+="<tr height=10%>";
		for(var j=0;j<=6;j++){
			tmpHTML+="<td align=center style=\"line-height: 10px \"></td>";
		}
		tmpHTML+="</tr>";
	} 
	tmpHTML+="</table>";
	tmpHTML+="</td>";
	tmpHTML+="</tr>";	
	tmpHTML+="<tr>";
	tmpHTML+="<td align=left>";
	tmpHTML+="<input type=button style='"+buttonStyle+"'  value=\"关闭\" id=\"button_close \" value=\"关闭\" onclick=\"dropHideen()\"";
	tmpHTML+="style=\"height: 20;width:20%\">";
	var newTodayMonth = _calendarControl.todayMonth+1;
	var newTodayDay = _calendarControl.todayDay;
	if(newTodayMonth<10){
		newTodayMonth = "0" + newTodayMonth;
	}
	if(newTodayDay<10){
		newTodayDay = "0" + newTodayDay;
	}
	tmpHTML+="<input type=button style='"+buttonStyle+"' id=\"button_today \" value=\"今日" +_calendarControl.todayYear+"-"+newTodayMonth+"-"+newTodayDay+"\" onclick=\"calendar_todayClick()\"";
	tmpHTML+="style=\"height: 20;width:80%\">";
	tmpHTML+="</td>";
	tmpHTML+="</tr>";
	tmpHTML+="</table></div>";
	if (_dropdown_box)
		(_dropdown_box).innerHTML=tmpHTML;
	else
		document.body.innerHTML=tmpHTML;

	calendar_dateChange(_calendarControl.todayYear,_calendarControl.todayMonth,_calendarControl.todayDay)	
}

function calendar_dateChange(year,month,day){
	var months=new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月")
	if (_calendarControl.year==year && _calendarControl.month==month && (!day || _calendarControl.day==day)) return;
		
	if (_calendarControl.year!=year || _calendarControl.month!=month){
		_calendarControl.year=year;
		_calendarControl.month=month;
		
		if (month==0){
			 _calendarControl.preMonth=11
			 _calendarControl.preYear=_calendarControl.year-1
		}else{
			 _calendarControl.preMonth=_calendarControl.month-1
			 _calendarControl.preYear=_calendarControl.year
		}
		if (month==11){
			_calendarControl.nextMonth=0
			_calendarControl.nextYear=_calendarControl.year+1
		}else{
			_calendarControl.nextMonth=_calendarControl.month+1
			_calendarControl.nextYear=_calendarControl.year  
		
		}
		_calendarControl.startday=(new Date(year,month,1)).getDay()	
		if (_calendarControl.startday==0) _calendarControl.startday=7
		var curNumdays=numberofDays(_calendarControl.month,_calendarControl.year)		  
		var preNumdays=numberofDays(_calendarControl.preMonth,_calendarControl.preYear)		
		var nextNumdays=numberofDays(_calendarControl.nextMonth,_calendarControl.nextYear)		
		var startDate=preNumdays-_calendarControl.startday+1	
		var endDate=42-curNumdays-_calendarControl.startday		
		
		monthValue.innerHTML=months[_calendarControl.month]
		yearValue.innerHTML=_calendarControl.year
		
		var datenum=0
		for (var i=startDate;i<=preNumdays;i++){
			calendarData.cells[datenum].setAttribute("monthAttribute","pre")
			calendarData.cells[datenum].style.color="gray"
			calendarData.cells[datenum].innerHTML=i			
			datenum++;		
		} 
		for (var i=1;i<=curNumdays;i++){
			calendarData.cells[datenum].setAttribute("monthAttribute","cur")
			calendarData.cells[datenum].style.color="black"
			calendarData.cells[datenum].innerHTML=i			
			datenum++;					
		} 		
		for (var i=1;i<=endDate;i++){
			calendarData.cells[datenum].setAttribute("monthAttribute","next")
			calendarData.cells[datenum].style.color="gray"
			calendarData.cells[datenum].innerHTML=i			
			datenum++;	
		}
	}
	
	if (day) _calendarControl.day=day;
	calendar_activeCellChange(calendarData.cells[_calendarControl.day+_calendarControl.startday-1]);		
}

function calendar_cellClick(cell){  
	calendar_activeCellChange(cell);
	var _editor = dropdown_button.getAttribute("edior");
	var newMonth = _calendarControl.month+1;
	var newDay = _calendarControl.day;
	if(newMonth<10){
		newMonth = "0" + newMonth;
	}
	if(newDay<10){
		newDay = "0" + newDay;
	}
	//_editor.value = _calendarControl.year + "-" + (_calendarControl.month +1) + "-"+ _calendarControl.day;
	_editor.value = _calendarControl.year + "-" + newMonth + "-"+ newDay;
		
	dropHideen();
}

function calendar_activeCellChange(cell){	
	
	function setActiveCell(cellIndex){
		calendarData.cells[_calendarControl.activeCellIndex].style.backgroundColor="";
		calendarData.cells[cellIndex].style.backgroundColor="#7D7DFF";
		_calendarControl.activeCellIndex=cellIndex;
		activeCell=_calendarControl.activeCellIndex%7
		activeRow=Math.floor(_calendarControl.activeCellIndex/7)
	}
		
	if (cell.tagName.toLowerCase()!="td") return;
	var _activeCellIndex=cell.parentElement.rowIndex*7+cell.cellIndex;	
	
	with(_calendarControl){	
		if (activeCellIndex==_activeCellIndex) return;

		var monthAttribute=cell.getAttribute("monthAttribute");
		switch (monthAttribute){
			case "pre":{	 			
				calendar_dateChange(preYear,preMonth,numberofDays(preMonth,preYear)-startday+_activeCellIndex+1);
				setActiveCell(startday+day-1);
				break
			}
			case "cur":{
				calendar_dateChange(year,month,_activeCellIndex-startday+1);
				setActiveCell(_activeCellIndex);
				break
			}
			case "next":{
				calendar_dateChange(nextYear,nextMonth,_activeCellIndex-numberofDays(month,year)-startday+1);
				setActiveCell(startday+day-1);
				break
			}
		}
	}
}
 

function calendar_todayClick(){
	
	calendar_dateChange(_calendarControl.todayYear,_calendarControl.todayMonth,_calendarControl.todayDay);
	var index=_calendarControl.todayDay+_calendarControl.startday-1;
	
	calendar_activeCellChange(calendarData.cells[index]);
	
	
	var _editor = dropdown_button.getAttribute("edior");
	var newMonth = _calendarControl.month+1;
	var newDay = _calendarControl.day;
	if(newMonth<10){
		newMonth = "0" + newMonth;
	}
	if(newDay<10){
		newDay = "0" + newDay;
	}
	//_editor.value = _calendarControl.year + "-" + (_calendarControl.month +1) + "-"+ _calendarControl.day;
	_editor.value = _calendarControl.year + "-" + newMonth + "-"+ newDay;
	// _editor.value = _calendarControl.year + "-" + (_calendarControl.month +1) + "-"+ _calendarControl.day;
	
	dropHideen();
}

function numberofDays(month,year){
	var numDays=new Array(31,28,31,30,31,30,31,31,30,31,30,31)
	n=numDays[month]
	if (month==1 && (year%4==0 && year%100!=0 || year%400==0)) n++
	return n
}

function calendar_setDate(date){
	calendar_dateChange(date.getDate(),today.getMonth(),getFullYear());
	
}

function calendar_vis(el){
		
	var dateArra = new Array(3);
	var _editor = el.getAttribute("edior");
	
	var index = 0;
	dropHideen();
	
	if (typeof(_dropdown_box)!="undefined")
		createCalendar();
			
	var pos =getAbsPosition(_editor);
	_dropdown_box.style.top = pos[1] +el.offsetHeight;
	_dropdown_box.style.left =pos[0] + el.offsetWidth-16;
	
	document.all["_dropdown_frame"].style.top = pos[1] +el.offsetHeight;
	document.all["_dropdown_frame"].style.left =pos[0] + el.offsetWidth-16;
	
	calendar_dateChange(_calendarControl.todayYear,_calendarControl.todayMonth,_calendarControl.todayDay);
	var index=_calendarControl.todayDay+_calendarControl.startday-1;

	calendar_activeCellChange(calendarData.cells[index]);
	
	_dropdown_box.style.visibility = "";
	document.all["_dropdown_frame"].style.visibility = "";
	
	return;
		
}


function dropdowndate(el){	

	if (typeof(CalendarControl)!="undefined")
		dropHideen();
	if (typeof(dropdown_button)!="undefined")
		dropdown_button.removeNode(true);	

	var drop_frm = document.createElement("<iframe  id=\"_dropdown_frame\" style=\"position: absolute; width:160; top:0 ;left:0;visibility :hidden ; filter:blendTrans(duration=0.3);Z-INDEX : 10000\" frameBorder=\"0\"> </iframe>");
	var drop_obj = document.createElement("<DIV id=\"_dropdown_box\" style=\"position: absolute; width:160; top:0 ;left:0; visibility :hidden ;filter:blendTrans(duration=0.3);Z-INDEX:10001\"></DIV>");
	
	parentHTML = "<input type=button style='"+buttonStyle+"' id=\"dropdown_button\" value=6  style=\"position: absolute; height:20;left:" +(el.offsetLeft + el.offsetWidth-16) + ";top:" + (el.offsetTop +1) + ";width:20;font-size:8;font-family:webdings;z-index:10001;\" onclick=\"calendar_vis(this)\" onmouseout='mouseout(this)>";
	obj=document.createElement(parentHTML);
	
	document.body.appendChild(obj);
	
	dropdown_button.setAttribute("edior",el);
	
	if (typeof(_dropdown_box)=="undefined")
	{
		document.body.appendChild(drop_frm);
			
		document.body.appendChild(drop_obj);
	}
	var pos =getAbsPosition(el);
	dropdown_button.style.top = pos[1];
	dropdown_button.style.left =pos[0] + el.offsetWidth-15;
	dropdown_button.style.height = el.offsetHeight;
	
	return
	
}

	
function getAbsPosition(obj, offsetObj){
	var _offsetObj=(offsetObj)?offsetObj:document.body;
	var x=obj.offsetLeft;
	var y=obj.offsetTop;
	
	var tmpObj=obj.offsetParent;

	while ((tmpObj!=_offsetObj) && tmpObj){
		x+=tmpObj.offsetLeft+tmpObj.clientLeft-tmpObj.scrollLeft;
		y+=tmpObj.offsetTop+tmpObj.clientTop-tmpObj.scrollTop;
		tmpObj=tmpObj.offsetParent;
	}
	return ([x, y]);
}

function mouseout(el){
	
	if (event.toElement == el.offsetParent){
		_dropdown_box.style.visibility = "hidden";
		document.all["_dropdown_frame"].style.visibility = "hidden";
	}
}


function dropHideen(){
	clearInterval();
	
	for(var i=0; i<_dropdown_box.children.length; i++){
			_dropdown_box.children[i].removeNode(true);
	}		
	_dropdown_box.style.visibility = "hidden";
	document.all["_dropdown_frame"].style.visibility = "hidden";
	document.all["dropdown_button"].style.visibility = "hidden";

}

function CalInit(){
	 if (typeof(dropdown_button)!="undefined"){
				if ((event.srcElement.id!="_dropdown_box" )&&(event.srcElement.id != "dropdown_button" ))
					dropHideen();
			}


}

