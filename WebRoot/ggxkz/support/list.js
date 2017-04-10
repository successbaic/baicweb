var urlString;

var classNameOld="lc2";
var rowNum=0;
function doSelect( obj, url, nRowNum )
{
	if (obj.className!="sc")	//已经选择了
	{
		classNameOld=obj.className;
	}
	unSelectAll();
	obj.className="sc";
	urlString=url;
	rowNum=nRowNum;
}

function unSelectAll()
{
	if(trid.length==null)
	{
		trid.className=classNameOld;
	}
	else
	{
		if (rowNum==null)
		{
			for(var i=0;i<trid.length;i++)
			{
				trid[i].className=classNameOld;
			}
		}
		if (rowNum>0)	//选择了一条记录
		{
			trid[rowNum-1].className=classNameOld;
		}
	}
	urlString=null;
	rowNum=0;
}

//没有提示，没有确认的版本
function jumpTo( sPage, sPara )
{
	self.location.href=generateURL( sPage, sPara, urlString );
}
function framejumpTo( sPage, sPara )
{	
	document.frames["editframe"].location=generateURL( sPage, sPara, urlString );
	document.all("editframe").style.display="block";
}

//有提示信息的版本：M=With Message(必须先选择一条记录再进行处理）
function jumpToM( sPage, sPara, sMessage )
{	
	self.location.href=generateURL( sPage, sPara, urlString );
}
function framejumpToM( sPage, sPara, sMessage ){
	
	document.frames["editframe"].location=generateURL( sPage, sPara, urlString );
	document.all("editframe").style.display="block";
}
//既有确认也有提示信息的版本：M=With Message, C=With Confirm
function jumpToMC( sPage, sPara, sMessage, sConfirmMessage )
{
	if (sMessage==null||sMessage=='')
	{
		jumpTo( sPage, sPara );
	}
	else if (sConfirmMessage==null||sConfirmMessage=='')
	{
		jumpToM( sPage, sPara, sMessage );
	}	
	else
	{
		if (window.confirm( sConfirmMessage ))	//确认通过
			self.location.href=generateURL( sPage, sPara, urlString );
		else
			return;
	}
}
function framejumpToMC( sPage, sPara, sMessage, sConfirmMessage )
{
	if (sMessage==null||sMessage=='')
	{
		framejumpTo( sPage, sPara );
	}
	else if (sConfirmMessage==null||sConfirmMessage=='')
	{
		framejumpToM( sPage, sPara, sMessage );
	}	
	else
	{
		if (window.confirm( sConfirmMessage ))	//确认通过
		{
			document.frames["editframe"].location=generateURL( sPage, sPara, urlString );
			document.all("editframe").style.display="block";
		}
		else
			return;
	}
}

function framejumpToC( sPage, sPara, sConfirmMessage )
{
	if (window.confirm( sConfirmMessage ))	//确认通过
		document.frames["editframe"].location=generateURL( sPage, sPara, urlString );
	else
		return;	
}

//根据条件生成页面路径
function generateURL( sPage, sPara, urlString )
{
	var sPageUrl='';
	if (sPara!='' && sPara!=null)	//有附加参数
	{
		sPageUrl=sPara;
	}	
	if (sPageUrl!='')	//有附加参数信息
		sPageUrl=sPage + "?" + sPageUrl;
	else				//没有附加参数信息
		sPageUrl=sPage;
	return sPageUrl;
}

function doCheckAll( bChecked )
{
	//alert( bChecked );
	if(document.form1.cbid.length==null)
	{
		document.form1.cbid.checked=bChecked;
	}
	else
	{
		for(var i=0;i<document.form1.cbid.length;i++)
		{
			document.form1.cbid[i].checked=bChecked;
		}
	}
}

//检查复选框是否选择
function doCheckSubmit( sMessage )
{	
	var check=0;
	if(document.form1.cbid.length==null)
	{
		if(document.form1.cbid.checked)
		{
			check=1;
		}
	}
	else
	{
		for(var i=0;i<document.form1.cbid.length;i++)
		{
			if(document.form1.cbid[i].checked)
			check=1;
		}
	}
	if(check==0)
	{
		window.alert( sMessage );
	}
	else
	{		
		document.form1.submit();
	}
	
}

//检查复选框是否选择,隐藏域赋初值
function doCheckSubmitH( sInput, sPara , sMessage )
{	
	var check=0;
	if(document.form1.cbid.length==null)
	{
		if(document.form1.cbid.checked)
		{
			check=1;
		}
	}
	else
	{
		for(var i=0;i<document.form1.cbid.length;i++)
		{
			if(document.form1.cbid[i].checked)
			check=1;
		}
	}
	if(check==0)
	{
		window.alert( sMessage );
	}
	else
	{		
		sInput.value = sPara;
		document.form1.submit();
	}
}

//从Url地址中解析参数值
//参数1:要解析的地址串 如:NBXH=111111111&QYMC=22222222
//参数2:要解析的变量名 如:NBXH
function fucGetUrlPar(urlstr,parname)	
{
	var lthyrlstr;
	if (urlstr != ""){
		lthyrlstr= urlstr.length;
		if(urlstr.indexOf(parname)!=-1){
			urlstr = urlstr.substring(urlstr.indexOf(parname),lthyrlstr);
			if(urlstr.indexOf("&")!=-1){
				urlstr = urlstr.substring(urlstr.indexOf("=")+1,urlstr.indexOf("&"));
			}
			else{
				urlstr = urlstr.substring(urlstr.indexOf("=")+1,urlstr.length);
			}
		}
		else{
			urlstr = "";		
		}
	}
	return urlstr;
}
function initLoading(id)
{
	var obj = document.getElementById(id);
	obj.style.top = (document.body.offsetHeight - obj.offsetHeight) / 1.5;
	obj.style.left = (document.body.offsetWidth - obj.offsetWidth) / 2;
}

function framejumpToMC2( sPage, sPara, sMessage, sConfirmMessage )
{
	if (sMessage==null||sMessage=='')
	{
		framejumpTo( sPage, sPara );
	}
	else if (sConfirmMessage==null||sConfirmMessage=='')
	{
		framejumpToM( sPage, sPara, sMessage );
	}
	else if (urlString=='' || urlString==null)	//没有选择一条记录
	{
		window.alert( sMessage );
		return;
	}
	else
	{
		if (window.confirm( sConfirmMessage ))	//确认通过
		{
			document.frames["editframe"].location=generateURL2( sPage, sPara, urlString );
		}
		else
			return;
	}
}

//根据条件生成页面路径
function generateURL2( sPage, sPara, urlString )
{
	var sPageUrl='';
	if (sPara!='' && sPara!=null)	//有附加参数
	{
		sPageUrl=sPara;
		if (urlString!='' && urlString!=null)		//选择了一条记录
			sPageUrl=sPageUrl + "&" + urlString;
	}
	else
	{
		if (urlString!='' && urlString!=null)		//选择了一条记录
			sPageUrl=sPageUrl + urlString;
	}
	if (sPageUrl!='')	//有附加参数信息
		sPageUrl=sPage + "?" + sPageUrl;
	else				//没有附加参数信息
		sPageUrl=sPage;
	return sPageUrl;
}

//有提示信息的版本：M=With Message(必须先选择一条记录再进行处理）
function jumpToM2( sPage, sPara, sMessage )
{
	if (urlString=='' || urlString==null)	//没有选择一条记录
	{
		window.alert( sMessage );
		return;
	}
	self.location.href=generateURL2( sPage, sPara, urlString );
}

function framejumpToM2( sPage, sPara, sMessage )
{
	if (urlString=='' || urlString==null)	//没有选择一条记录
	{
		window.alert( sMessage );
		return;
	}
//	alert( generateURL2( sPage, sPara, urlString ) );
	document.frames["editframe"].location=generateURL2( sPage, sPara, urlString );
}

function framejumpToMC3( sPage, sPara, sMessage, sConfirmMessage )
{
	if (urlString=='' || urlString==null)	//没有选择一条记录
	{
		window.alert( sMessage );
		return;
	}
	else
	{
		if (window.confirm( sConfirmMessage ))	//确认通过
		{
			document.frames["editframe"].location=generateURL2( sPage, sPara, urlString );
		}
		else
			return;
	}
}
//没有提示，没有确认的版本
function jumpTo2( sPage, sPara )
{
	self.location.href=generateURL( sPage, sPara, urlString );
}
function framejumpTo2( sPage, sPara )
{
	document.frames["editframe"].location=generateURL( sPage, sPara, urlString );
}