<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<html>
<head>
<title></title>
</head>
<jsp:useBean id="GSGSJIN_SUB02" scope="page" class="com.macrosoft.icms.gsnw.GSGSJIN_SUB02"/>
<jsp:useBean id="Par" scope="page" class="com.macrosoft.icms.system.SysParameter"/>
<body>
<form name="form1" method="POST" action='gqdj_czxx_action.jsp' target="editframe">
<%
	String ID= GSGSJIN_SUB02.doPreProcess(request.getParameter("ID")).trim();
	String OPENO= GSGSJIN_SUB02.doPreProcess(request.getParameter("OPENO")).trim();
	// 是否取全部投资人（包括法人） 用于股权质押设立登记
	String isAll= GSGSJIN_SUB02.doPreProcess(request.getParameter("ISALL")).trim();
	String action = SysUtility.doPreProcess(request.getParameter("action"));
%>
<br>
<table border="0" width="90%"  cellpadding="0" cellspacing="0" align=center>
<tr>
	<td>
	<select size="20" style='width:100%;heigth:200px;' name="TZRXX" title="投资人列表">
		<%
			if (!ID.equals(""))
				out.println(GSGSJIN_SUB02.getCZXXFULLList(ID, isAll));
			else
				out.println(GSGSJIN_SUB02.getCZXXFULLList(ID, isAll));
		%>
	</select>
		</td>
	</tr>
	<br/>
	<tr>
	<td align=center>
	<%
			if (action.equals("4")) //4 查看
			{
	%>
			<input name="btRet" type="button" value="返  回" onclick="parent.window.location.reload();" class="inp_L1"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
	<%
			}
			else
			{
			%>
			<input name="btSave" type="button" value="保  存" class="inp_L1" onclick="dosth()"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
			<%
			}
			%>
			</td>
	</tr>
</table>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe" ></iframe> 
<iframe height="0" width="0" src="" name="hiddenframe" id="hiddenframe"></iframe>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function dosth()
	{
		rr = document.form1.TZRXX;
		var ret = new Array(3);
		

		if (rr.selectedIndex!=-1)
		{
			//ret[0]=rr.options[rr.selectedIndex].value;
			//ret[1]=rr.options[rr.selectedIndex].CERTYPE;
			//ret[2]=rr.options[rr.selectedIndex].CERNO;
			//ret[3]=rr.options[rr.selectedIndex].BLICNO;
		 window.parent.document.getElementById("EXPMOR").value = rr.options[rr.selectedIndex].value; 
		 window.parent.document.getElementById("EXPMORBLICNO").value = rr.options[rr.selectedIndex].CERNO;
		 window.parent.document.getElementById("HOLDERTYPE").value = rr.options[rr.selectedIndex].HOLDERTYPE; //股东类型
		 window.parent.document.getElementById("HOLDERSHARE").value = rr.options[rr.selectedIndex].HOLDERSHARE; //拥有权益（万元）
		 window.parent.document.getElementById("SN").value = rr.options[rr.selectedIndex].SN; //股权序号
		 
		 window.parent.document.getElementById('editDiv').style.display='none'
		
		}
		else
			alert('请先选中出资人再确定！');
	}
//-->
</SCRIPT>
</body>      
</html>