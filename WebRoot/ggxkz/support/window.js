//û����ʾ��û��ȷ�ϵİ汾
function winjumpTo( sPage, sPara )
{
	openNewWindow( generateURL( sPage, sPara, urlString ) );
}

//����ʾ��Ϣ�İ汾��M=With Message(������ѡ��һ����¼�ٽ��д���
function winjumpToM( sPage, sPara, sMessage )
{
	if (urlString=='' || urlString==null)	//û��ѡ��һ����¼
	{
		window.alert( sMessage );
		return;
	}
	openNewWindow( generateURL( sPage, sPara, urlString ) );
}

//��Ҫ����ȷ�ϵİ汾��C=With Confirm
function winjumpToC( sPage, sPara, sConfirmMessage )
{
	if (window.confirm( sConfirmMessage ))	//ȷ��ͨ��
	openNewWindow( generateURL( sPage, sPara, urlString ) );
}

//����ȷ��Ҳ����ʾ��Ϣ�İ汾��M=With Message, C=With Confirm
function winjumpToMC( sPage, sPara, sMessage, sConfirmMessage )
{
	if (urlString=='' || urlString==null)	//û��ѡ��һ����¼
	{
		window.alert( sMessage );
		return;
	}
	if (window.confirm( sConfirmMessage ))	//ȷ��ͨ��
	openNewWindow( generateURL( sPage, sPara, urlString ) );
}

//��һ���´���
function openNewWindow( htmlurl )
{
	var newwin=window.open(htmlurl,'_blank','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,left=0,top=0,fullscreen=yes');
	return false;
}
//��һ���´���(����)
function winOpen( htmlurl,pram, scrWidth, scrHeigh)
{
	width=screen.width-scrWidth;
 	height=screen.height-scrHeigh;
 	if (pram!='' && pram!=null)	
 		htmlurl=htmlurl+'?'+pram;
	window.open(htmlurl,'_blank','toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,status=yes,left=0,top=0, height='+height+',width='+width+' fullscreen=no');
 }



//����ʾ��Ϣ�İ汾��M=With Message(������ѡ��һ����¼�ٽ��д���С����
function lwinjumpToM( sPage, sPara, sMessage )
{
	if (urlString=='' || urlString==null)	//û��ѡ��һ����¼
	{
		window.alert( sMessage );
		return;
	}
	openLWindow( generateURL( sPage, sPara, urlString ) );
}

//����ʾ��Ϣ�İ汾��M=With Message(������ѡ��һ����¼�ٽ��д��������趨���ڴ�С��λ��
function lwinjumpToMS( sPage, sPara, sMessage, sLeft, sTop, sHeight, sWidth )
{
	if (urlString=='' || urlString==null)	//û��ѡ��һ����¼
	{
		window.alert( sMessage );
		return;
	}
	openLSWindow( generateURL( sPage, sPara, urlString ), sLeft, sTop, sHeight, sWidth );
}


//û����ʾ��û��ȷ�ϵİ汾
function lwinjumpTo( sPage, sPara, sLeft, sTop, sHeight, sWidth )
{
	openLSWindow( generateURL( sPage, sPara, urlString ), sLeft, sTop, sHeight, sWidth );
}

//��һ���´��ڣ�С����
function openLWindow( htmlurl )
{
	var newwin=window.open(htmlurl,'_blank','toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=yes,left=100,top=100, height=250,width=600 fullscreen=no');
	return false;
}

//��һ���´���(�����趨���ڴ�С��λ��)
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