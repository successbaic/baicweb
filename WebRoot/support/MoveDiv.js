currentX = currentY = 0; 
whichEl = null;						//��ǰ�ƶ��Ŀؼ�
BORDERSTYLE="1px solid black";		//�����ƶ�ʱ��Border����
whichAction="";						//��ǰ�ؼ�ִ�еĶ���move / w-resize / s-resize / se-resize

//�ж��Ƿ�����ƶ��ĺ�����������DIV��ǩ�Ŀؼ������ҿɼ��Ѿ���ʾ
function canMove( obj )
{
	if ( obj.tagName == "DIV" && obj.style.border!='' )
		return true;
	else
		return false;
}

//��ĳ���ؼ��ϵ����������ú���������ȷ���϶��ؼ�
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

//�ƶ��ؼ����޸Ŀؼ���С
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


//���ؼ���Ч��
function checkEl() 
{ 
	if (whichEl!=null) 
		{ return false } 
} 

//�϶���ɣ��ͷſؼ�
function dropEl() 
{ 
	whichEl = null; 
	whichAction="";
} 

//������ "100px" ���ַ����л�����е����ֲ��֣�100
function getCorNumber( str )
{
	return parseInt(str.substring( 0, str.length-2 ));
}

//��������λ��ȷ����ʾ�������״
function cursEl() 
{ 
	//alert( event.srcElement.style.border );
	mouseX=(event.clientX + document.body.scrollLeft); 
	mouseY=(event.clientY + document.body.scrollTop); 
	objectRight=getCorNumber(event.srcElement.style.left) + getCorNumber(event.srcElement.style.width);
	objectBottom=getCorNumber(event.srcElement.style.top) + getCorNumber(event.srcElement.style.height);

	//message.innerHTML=" mouseX=" + mouseX + "  mouseY=" + mouseY + "  objectRight=" + objectRight + "  objectBottom=" + objectBottom;
	if ( canMove( event.srcElement ))	//�����ƶ�
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
