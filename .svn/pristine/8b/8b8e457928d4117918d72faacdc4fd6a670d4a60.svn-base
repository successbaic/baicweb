<%@page contentType="text/html;charset=GBK"%>
<script language="javascript" src="http://<%=request.getHeader("Host")+request.getContextPath()%>/support/MoveDiv.js"></script>
<script language="javascript">
//////Internet选项->安全->Internet->自定义级别->对没有标记为安全的ActiveX控件进行初始化和脚本运行进行启用
header="",footer="";
portrait=true;
paperSize="A3";
leftMargin=0.0,topMargin=0.0,rightMargin=0.0,bottomMargin=0.0;
//读取配置文件中的IE页边距设置
function LoadPage(filename)
{
	/////save init pos
	header=factory.printing.header;
	footer=factory.printing.footer;
	portrait=factory.printing.portrait;
	//paperSize=factory.printing.paperSize;
	leftMargin=factory.printing.leftMargin;
	topMargin=factory.printing.topMargin;
	rightMargin=factory.printing.rightMargin;
	bottomMargin=factory.printing.bottomMargin;
	var fso;
	var a;
	var fldr="C:\\PageSetup";
	var filespec=fldr+"\\"+filename+".ie";

	fso = new ActiveXObject("Scripting.FileSystemObject");
	if (!fso.FileExists(filespec))
	{
		alert("对不起,本地文件夹"+filespec+"中没有找到配置文件!");
		return;	
	}
	a = fso.OpenTextFile(filespec,1, false);
	while(!a.AtEndOfLine) 	
	{
		s=a.ReadLine();
		if(s!=null)
		{
			eval(s);
		}	
	}
	a.Close();
	//alert("页边距读取完毕!");

}
//保存配置文件中的IE页边距设置
function SavePage(filename)
{
	
	var fso;
	var a;
	var fldr="C:\\PageSetup";
	var filespec=fldr+"\\"+filename+".ie";

	fso = new ActiveXObject("Scripting.FileSystemObject");
	if (!fso.FolderExists(fldr))
		fldr = fso.CreateFolder(fldr);
	if (fso.FileExists(filespec))
	{
		fso.DeleteFile(filespec);		
	}	
	a = fso.CreateTextFile(filespec, true);	
	a.WriteLine("factory.printing.header=\"\"");
	a.WriteLine("factory.printing.footer=\"\"");
	a.WriteLine("factory.printing.portrait="+factory.printing.portrait);
	//a.WriteLine("factory.printing.paperSize="+factory.printing.paperSize);
	a.WriteLine("factory.printing.leftMargin="+factory.printing.leftMargin);
	a.WriteLine("factory.printing.topMargin="+factory.printing.topMargin);
	a.WriteLine("factory.printing.rightMargin="+factory.printing.rightMargin);
	a.WriteLine("factory.printing.bottomMargin="+factory.printing.bottomMargin);	
	a.Close();
	alert("页边距保存完毕!");
}
//重置配置文件中的IE页边距设置
function SetPageDefault()
{	
	factory.printing.header= "";
	factory.printing.footer = "";
	factory.printing.portrait = false;
	//factory.printing.paperSize = "A4";
	factory.printing.leftMargin = 19.5;
	factory.printing.topMargin = 19.5;
	factory.printing.rightMargin = 19.5;
	factory.printing.bottomMargin = 19.5;
	alert("页边距设置完毕!");
}
//保存div中的位置
function SavePostion(filename)
{
	var fso;
	var a;
	var fldr="C:\\PageSetup";
	var filespec=fldr+"\\"+filename+".pos";

	fso = new ActiveXObject("Scripting.FileSystemObject");
	if (!fso.FolderExists(fldr))
		fldr = fso.CreateFolder(fldr);
	if (fso.FileExists(filespec))
	{
		fso.DeleteFile(filespec);		
	}	
	a = fso.CreateTextFile(filespec, true);
	var aDivs = document.body.all.tags("DIV");
	for(i = 0; i <aDivs.length; i++)
	{
		if(aDivs(i).id!=null)
		{
			a.WriteLine(aDivs(i).id+".style.left = \""+ aDivs(i).style.left+ "\"");
			a.WriteLine(aDivs(i).id+".style.top = \""+ aDivs(i).style.top + "\"");
		}		
	}
	a.Close();
	alert("打印位置保存完毕!");
}
//读取配置文件中的div位置
function loadPostion(filename)
{
	var fso;
	var a;
	var fldr="C:\\PageSetup";
	var filespec=fldr+"\\"+filename+".pos";

	fso = new ActiveXObject("Scripting.FileSystemObject");
	if (!fso.FileExists(filespec))
	{
		alert("对不起,本地文件夹"+filespec+"中没有找到配置文件!");
		return;	
	}
	a = fso.OpenTextFile(filespec,1, false);
	while(!a.AtEndOfLine) 	
	{
		s=a.ReadLine();
		if(s!=null)
		{
			eval(s);
		}	
	}
	a.Close();
	//alert("打印位置读取完毕!");
}
//设置DIV的值
function setDivValue( name, value )
{
	var aDivs = document.body.all.tags("DIV");
	for (i=0; i<aDivs.length; i++ )
	{
		if (aDivs[i].id.toUpperCase()==name.toUpperCase())
		{
			aDivs[i].innerHTML=value;
		}
	}
}

function printsetup()
{	
	WebBrowser.execwb(8,1);// 打印页面设置
}
function printpreview()
{
	WebBrowser.execwb(7,1);// 打印页面预览
}

function printit()
{
	WebBrowser.execwb(6,6)
}
</script>
<!--media=print 这个属性可以在打印时有效-->
<style media="print">
.Noprint{display:none;}
.PageNext{page-break-after: always;}
</style>
<object id="factory" viewastext  classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" height=0 width=0  codebase="http://<%=request.getHeader("Host")+request.getContextPath()%>/support/ScriptX.cab#Version=6,2,433,14">
</object>
<object id="WebBrowser" name="WebBrowser" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height=0 width=0>
</object>
<div id="PageSet" name ="PageSet" style="position:absolute;z-index:1; left:2px; width:600px; top:2px; height:0px;font-family:宋体;font-size:12pt;border:2px;text-align: left">
<input type=button value="打印页面" onclick="printit()" class="NOPRINT">
<input type=button value="页面设置" onclick="printsetup()" class="NOPRINT">
<input type=button value="打印预览" onclick="printpreview()" class="NOPRINT">
<input type=button value="保存设置" onclick="SavePostion('<%=PrintPageName%>');SavePage('<%=PrintPageName%>')" class="NOPRINT">
<!--
<input type=button value="保存页边距" onclick="SavePage('<%=PrintPageName%>')" class="NOPRINT">
<input type=button value="读取页边距" onclick="LoadPage('<%=PrintPageName%>')" class="NOPRINT">
<input type=button value="读取位置" onclick="loadPostion('<%=PrintPageName%>')" class="NOPRINT">
<input type=button value="设定显示值" onclick="setDivValue('zhmc','字号名称')" class="NOPRINT">
-->
<input type=button value="关闭页面" onClick="javascript:window.close()" class="NOPRINT">
<br>
<font size="2" color="red" class="NOPRINT">
设置说明:将IE->Internet选项->安全->Internet->自定义级别->对没有标记为安全的ActiveX控件进行初始化和脚本运行->启用
</font>

</div>
