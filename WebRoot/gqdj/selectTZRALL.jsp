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
	// �Ƿ�ȡȫ��Ͷ���ˣ��������ˣ� ���ڹ�Ȩ��Ѻ�����Ǽ�
	String isAll= GSGSJIN_SUB02.doPreProcess(request.getParameter("ISALL")).trim();
	String action = SysUtility.doPreProcess(request.getParameter("action"));
%>
<br>
<table border="0" width="90%"  cellpadding="0" cellspacing="0" align=center>
<tr>
	<td>
	<select size="20" style='width:100%;heigth:200px;' name="TZRXX" title="Ͷ�����б�">
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
			if (action.equals("4")) //4 �鿴
			{
	%>
			<input name="btRet" type="button" value="��  ��" onclick="parent.window.location.reload();" class="inp_L1"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
	<%
			}
			else
			{
			%>
			<input name="btSave" type="button" value="��  ��" class="inp_L1" onclick="dosth()"  onMouseOver="this.className='inp_L2'" onMouseOut="this.className='inp_L1'">
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
		 window.parent.document.getElementById("HOLDERTYPE").value = rr.options[rr.selectedIndex].HOLDERTYPE; //�ɶ�����
		 window.parent.document.getElementById("HOLDERSHARE").value = rr.options[rr.selectedIndex].HOLDERSHARE; //ӵ��Ȩ�棨��Ԫ��
		 window.parent.document.getElementById("SN").value = rr.options[rr.selectedIndex].SN; //��Ȩ���
		 
		 window.parent.document.getElementById('editDiv').style.display='none'
		
		}
		else
			alert('����ѡ�г�������ȷ����');
	}
//-->
</SCRIPT>
</body>      
</html>