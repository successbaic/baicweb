<%@page contentType="text/html;charset=GBK"%>
<script language="javascript" src="http://<%=request.getHeader("Host")+request.getContextPath()%>/support/MoveDiv.js"></script>
<script language="javascript">
//////Internetѡ��->��ȫ->Internet->�Զ��弶��->��û�б��Ϊ��ȫ��ActiveX�ؼ����г�ʼ���ͽű����н�������
header="",footer="";
portrait=true;
paperSize="A3";
leftMargin=0.0,topMargin=0.0,rightMargin=0.0,bottomMargin=0.0;
//��ȡ�����ļ��е�IEҳ�߾�����
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
		alert("�Բ���,�����ļ���"+filespec+"��û���ҵ������ļ�!");
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
	//alert("ҳ�߾��ȡ���!");

}
//���������ļ��е�IEҳ�߾�����
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
	alert("ҳ�߾ౣ�����!");
}
//���������ļ��е�IEҳ�߾�����
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
	alert("ҳ�߾��������!");
}
//����div�е�λ��
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
	alert("��ӡλ�ñ������!");
}
//��ȡ�����ļ��е�divλ��
function loadPostion(filename)
{
	var fso;
	var a;
	var fldr="C:\\PageSetup";
	var filespec=fldr+"\\"+filename+".pos";

	fso = new ActiveXObject("Scripting.FileSystemObject");
	if (!fso.FileExists(filespec))
	{
		alert("�Բ���,�����ļ���"+filespec+"��û���ҵ������ļ�!");
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
	//alert("��ӡλ�ö�ȡ���!");
}
//����DIV��ֵ
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
	WebBrowser.execwb(8,1);// ��ӡҳ������
}
function printpreview()
{
	WebBrowser.execwb(7,1);// ��ӡҳ��Ԥ��
}

function printit()
{
	WebBrowser.execwb(6,6)
}
</script>
<!--media=print ������Կ����ڴ�ӡʱ��Ч-->
<style media="print">
.Noprint{display:none;}
.PageNext{page-break-after: always;}
</style>
<object id="factory" viewastext  classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" height=0 width=0  codebase="http://<%=request.getHeader("Host")+request.getContextPath()%>/support/ScriptX.cab#Version=6,2,433,14">
</object>
<object id="WebBrowser" name="WebBrowser" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height=0 width=0>
</object>
<div id="PageSet" name ="PageSet" style="position:absolute;z-index:1; left:2px; width:600px; top:2px; height:0px;font-family:����;font-size:12pt;border:2px;text-align: left">
<input type=button value="��ӡҳ��" onclick="printit()" class="NOPRINT">
<input type=button value="ҳ������" onclick="printsetup()" class="NOPRINT">
<input type=button value="��ӡԤ��" onclick="printpreview()" class="NOPRINT">
<input type=button value="��������" onclick="SavePostion('<%=PrintPageName%>');SavePage('<%=PrintPageName%>')" class="NOPRINT">
<!--
<input type=button value="����ҳ�߾�" onclick="SavePage('<%=PrintPageName%>')" class="NOPRINT">
<input type=button value="��ȡҳ�߾�" onclick="LoadPage('<%=PrintPageName%>')" class="NOPRINT">
<input type=button value="��ȡλ��" onclick="loadPostion('<%=PrintPageName%>')" class="NOPRINT">
<input type=button value="�趨��ʾֵ" onclick="setDivValue('zhmc','�ֺ�����')" class="NOPRINT">
-->
<input type=button value="�ر�ҳ��" onClick="javascript:window.close()" class="NOPRINT">
<br>
<font size="2" color="red" class="NOPRINT">
����˵��:��IE->Internetѡ��->��ȫ->Internet->�Զ��弶��->��û�б��Ϊ��ȫ��ActiveX�ؼ����г�ʼ���ͽű�����->����
</font>

</div>