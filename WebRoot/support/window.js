//没有提示，没有确认的版本
function winjumpTo( sPage, sPara )
{
	openNewWindow( generateURL( sPage, sPara, urlString ) );
}

//有提示信息的版本：M=With Message(必须先选择一条记录再进行处理）
function winjumpToM( sPage, sPara, sMessage )
{
	if (urlString=='' || urlString==null)	//没有选择一条记录
	{
		window.alert( sMessage );
		return;
	}
	openNewWindow( generateURL( sPage, sPara, urlString ) );
}

//需要经过确认的版本：C=With Confirm
function winjumpToC( sPage, sPara, sConfirmMessage )
{
	if (window.confirm( sConfirmMessage ))	//确认通过
	openNewWindow( generateURL( sPage, sPara, urlString ) );
}

//既有确认也有提示信息的版本：M=With Message, C=With Confirm
function winjumpToMC( sPage, sPara, sMessage, sConfirmMessage )
{
	if (urlString=='' || urlString==null)	//没有选择一条记录
	{
		window.alert( sMessage );
		return;
	}
	if (window.confirm( sConfirmMessage ))	//确认通过
	openNewWindow( generateURL( sPage, sPara, urlString ) );
}

//打开一个新窗口
function openNewWindow( htmlurl )
{
	var newwin=window.open(htmlurl,'_blank','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,left=0,top=0,fullscreen=yes');
	return false;
}
//打开一个新窗口(居中)
function winOpen( htmlurl,pram, scrWidth, scrHeigh)
{
	width=screen.width-scrWidth;
 	height=screen.height-scrHeigh;
 	if (pram!='' && pram!=null)	
 		htmlurl=htmlurl+'?'+pram;
	window.open(htmlurl,'_blank','toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,status=yes,left=0,top=0, height='+height+',width='+width+' fullscreen=no');
 }



//有提示信息的版本：M=With Message(必须先选择一条记录再进行处理）小窗口
function lwinjumpToM( sPage, sPara, sMessage )
{
	if (urlString=='' || urlString==null)	//没有选择一条记录
	{
		window.alert( sMessage );
		return;
	}
	openLWindow( generateURL( sPage, sPara, urlString ) );
}

//有提示信息的版本：M=With Message(必须先选择一条记录再进行处理）可以设定窗口大小及位置
function lwinjumpToMS( sPage, sPara, sMessage, sLeft, sTop, sHeight, sWidth )
{
	if (urlString=='' || urlString==null)	//没有选择一条记录
	{
		window.alert( sMessage );
		return;
	}
	openLSWindow( generateURL( sPage, sPara, urlString ), sLeft, sTop, sHeight, sWidth );
}


//没有提示，没有确认的版本
function lwinjumpTo( sPage, sPara, sLeft, sTop, sHeight, sWidth )
{
	openLSWindow( generateURL( sPage, sPara, urlString ), sLeft, sTop, sHeight, sWidth );
}

//打开一个新窗口，小窗口
function openLWindow( htmlurl )
{
	var newwin=window.open(htmlurl,'_blank','toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=yes,left=100,top=100, height=250,width=600 fullscreen=no');
	return false;
}

//打开一个新窗口(可以设定窗口大小及位置)
function openLSWindow( htmlurl, sLeft, sTop, sHeight, sWidth  )
{
	var newwin=window.open(htmlurl,'_blank','toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=yes,left='+sLeft+',top='+sTop+', height='+sHeight+',width='+sWidth+' fullscreen=no');
	return false;
}

// type='input' or type='textarea'
function disableAll()
{
	var all = document.all;
	for (k=0;k<=all.length-1 ;k++ )
	{
		if ((all[k].tagName.toUpperCase()=="INPUT") || (all[k].tagName.toUpperCase()=="TEXTAREA") || (all[k].tagName.toUpperCase()=="SELECT"))
		{
			if ((all[k].type.toUpperCase()!="BUTTON") && ((all[k].type.toUpperCase()!="SUBMIT")) && ((all[k].type.toUpperCase()!="RESET")))
				all[k].disabled=true;
		}
	}
}
function enableAll()
{
	var all = document.all;
	for (k=0;k<=all.length-1 ;k++ )
	{
		if ((all[k].tagName.toUpperCase()=="INPUT") || (all[k].tagName.toUpperCase()=="TEXTAREA") || (all[k].tagName.toUpperCase()=="SELECT"))
		{
			if ((all[k].type.toUpperCase()!="BUTTON") && ((all[k].type.toUpperCase()!="SUBMIT")) && ((all[k].type.toUpperCase()!="RESET")))
				all[k].disabled=false;
		}
	}
}