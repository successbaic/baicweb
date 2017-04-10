currentX = currentY = 0; 
whichEl = null;						//当前移动的控件
BORDERSTYLE="1px solid black";		//设置移动时的Border类型
whichAction="";						//当前控件执行的动作move / w-resize / s-resize / se-resize

//判断是否可以移动的函数：必须是DIV标签的控件，并且可见已经显示
function canMove( obj )
{
	if ( obj.tagName == "DIV" && obj.style.border!='' )
		return true;
	else
		return false;
}

//在某个控件上单击，触发该函数，用于确定拖动控件
function grabEl() 
{
	whichEl = event.srcElement; 
	while ( !canMove( whichEl ) ) 
	{ 
		whichEl = whichEl.parentElement; 
		if (whichEl == null) 
			{ return } 
	} 

	//if (whichEl != activeEl) 
	{ 
		activeEl = whichEl; 
	} 

	whichEl.style.pixelLeft = whichEl.offsetLeft; 
	whichEl.style.pixelTop = whichEl.offsetTop; 
	
	currentX = (event.clientX + document.body.scrollLeft); 
	currentY = (event.clientY + document.body.scrollTop); 
	if (event.srcElement.style.cursor=="w-resize")
	{
		whichAction="w-resize";
	}
	else
	{
		if (event.srcElement.style.cursor=="s-resize")
		{
			whichAction="s-resize";
		}
		else
		{
			if( event.srcElement.style.cursor=="se-resize" )
			{
				whichAction="se-resize";
			}
			else
				whichAction="move";
		}
	}
} 

//移动控件，修改控件大小
function moveEl() 
{ 
	if (whichEl == null) 
		{ return }; 

	//alert( event.srcElement.style.cursor );
	mouseX=(event.clientX + document.body.scrollLeft); 
	mouseY=(event.clientY + document.body.scrollTop); 
	objectRight=getCorNumber(whichEl.style.left) + getCorNumber(whichEl.style.width);
	objectBottom=getCorNumber(whichEl.style.top) + getCorNumber(whichEl.style.height);
	//message.innerHTML=" mouseX=" + mouseX + "  mouseY=" + mouseY + "  objectRight=" + objectRight + "  objectBottom=" + objectBottom +"  clientHeight="+whichEl.clientHeight;

	if (whichAction=="w-resize")
	{
		currentWidth=mouseX-getCorNumber( whichEl.style.left );
		if (currentWidth<=0 )
			currentWidth=1;
		whichEl.style.width=currentWidth+"px";
		if ( getCorNumber( whichEl.style.width ) < whichEl.clientWidth )
			whichEl.style.width=whichEl.clientWidth + "px";
	}
	else
	{
		if (whichAction=="s-resize" )
		{
			currentHeight=mouseY-getCorNumber( whichEl.style.top );
			if (currentHeight<=0)
				currentHeight=1;
			whichEl.style.height=currentHeight+"px";
			if ( getCorNumber( whichEl.style.height ) < whichEl.clientHeight )
			{
				whichEl.style.height=whichEl.clientHeight + "px";
			}
		}
		else
		{
			if (whichAction=="se-resize" )
			{
				currentWidth=mouseX-getCorNumber( whichEl.style.left );
				if (currentWidth<=0 )
					currentWidth=1;
				whichEl.style.width=currentWidth+"px";
				if ( getCorNumber( whichEl.style.width ) < whichEl.clientWidth )
					whichEl.style.width=whichEl.clientWidth + "px";
				currentHeight=mouseY-getCorNumber( whichEl.style.top );
				if (currentHeight<=0)
					currentHeight=1;
				whichEl.style.height=currentHeight+"px";
				if ( getCorNumber( whichEl.style.height ) < whichEl.clientHeight )
				{
					whichEl.style.height=whichEl.clientHeight + "px";
				}
			}
			else
			{
				newX = (event.clientX + document.body.scrollLeft); 
				newY = (event.clientY + document.body.scrollTop); 
				distanceX = (newX - currentX); 
				distanceY = (newY - currentY); 
				currentX = newX; 
				currentY = newY; 

				whichEl.style.pixelLeft += distanceX; 
				if (whichEl.style.pixelLeft<0 )	whichEl.style.pixelLeft=0;
				whichEl.style.pixelTop += distanceY; 
				if (whichEl.style.pixelTop <0 ) whichEl.style.pixelTop=0;
				event.returnValue = false; 
			}
		}
	}
} 


//检查控件有效性
function checkEl() 
{ 
	if (whichEl!=null) 
		{ return false } 
} 

//拖动完成，释放控件
function dropEl() 
{ 
	whichEl = null; 
	whichAction="";
} 

//从类似 "100px" 的字符串中获得其中的数字部分，100
function getCorNumber( str )
{
	return parseInt(str.substring( 0, str.length-2 ));
}

//根据鼠标的位置确定显示的鼠标形状
function cursEl() 
{ 
	//alert( event.srcElement.style.border );
	mouseX=(event.clientX + document.body.scrollLeft); 
	mouseY=(event.clientY + document.body.scrollTop); 
	objectRight=getCorNumber(event.srcElement.style.left) + getCorNumber(event.srcElement.style.width);
	objectBottom=getCorNumber(event.srcElement.style.top) + getCorNumber(event.srcElement.style.height);

	//message.innerHTML=" mouseX=" + mouseX + "  mouseY=" + mouseY + "  objectRight=" + objectRight + "  objectBottom=" + objectBottom;
	if ( canMove( event.srcElement ))	//可以移动
	{
		if ( mouseX > objectRight -10 && mouseX < objectRight + 10 )
		{
			if ( mouseY > objectBottom -10 && mouseY < objectBottom + 10 )
				event.srcElement.style.cursor = "se-resize";
			else
				event.srcElement.style.cursor = "w-resize";
		}
		else
		{
			if ( mouseY > objectBottom -10 && mouseY < objectBottom + 10 )
				event.srcElement.style.cursor = "s-resize";
			else
				event.srcElement.style.cursor = "move" 
		}
	} 
} 

document.onmousedown = grabEl; 
document.onmousemove = moveEl; 
document.onmouseup = dropEl; 
document.onmouseover = cursEl; 
document.onselectstart = checkEl; 
