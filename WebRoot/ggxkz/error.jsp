<%@ page contentType="text/html;charset=GBK"%>
<%@ page isErrorPage="true"%>
<html>
<LINK href="<%=request.getContextPath()%>/css/icms.css" type="text/css" rel="stylesheet">
<%
	String sClassName=exception.getClass().getName();		//ȡ��������֣����Է��ദ��
	System.out.println( "Error.jsp- Exception Type: " + sClassName );

	//��������ԭʼ������Ϣ��IO Stream
	java.io.PrintWriter pw=new java.io.PrintWriter( out );
/*
	//�Զ����쳣�ࣺICMSException
	if (sClassName.compareTo("com.macrosoft.icms.ICMSException")==0)
	{
		com.macrosoft.icms.ICMSException e=(com.macrosoft.icms.ICMSException)exception;
	}
	//ʵ����ʼ��������
	else if (sClassName.compareTo("java.lang.InstantiationException")==0)
	{
		java.lang.InstantiationException e=(java.lang.InstantiationException)exception;
	}
	//SQLException:���ݿ����
	else if (sClassName.compareTo("java.sql.SQLException")==0)
	{
		java.sql.SQLException e=(java.sql.SQLException)exception;
	}

	//��ָ�����
	else if (sClassName.compareTo("java.lang.NullPointerException")==0)
	{
		java.lang.NullPointerException e=(java.lang.NullPointerException)exception;
	}
	//����δ�������
	else
	{
	//	Exception e=(Exception)exception;
	}
*/
%>
<body>
<br/><br/><br/>
<table width="500px" align="center" border="1">
<tr style=" background-image:url(../images/main/ywbltitleBG.jpg);background-repeat:repeat-x;line-height: 23px;">
<td onclick="ToggleDisplay()">
ϵͳ��ʾ��
</td>
</tr>
<tr><td>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
����ǰ�ķ��ʲ����������У�
</td>
</tr>
<tr><td>
<b>����ԭ��</b>
</td>
</tr>
<tr><td>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
<%=exception.getMessage()%>
</td>
</tr>
<tr><td>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
���Ժ�<span style="cursor:hand" onclick='javascript:window.history.back();'><font color=blue>���� </font></span>��
��
<span style="cursor:hand" onclick="parent.window.location.href='ggxkz_ys_list.jsp'"><font color=blue>���µ�½ </font></span>		
</td>
</tr>
</table>

<table id="t1" width="100%" style="display:none">
  <tr>
    <td width="100%" align="center"><b>������ԭʼ������Ϣ</b></td>
  </tr>
  <tr>
    <td width="100%"><%exception.printStackTrace( pw );%></td>
  </tr>
</table>

</body>
<script language="javascript">
function ToggleDisplay()
{
	if(document.getElementById("t1").style.display=="none"){
		document.getElementById("t1").style.display="";
	}else{
		document.getElementById("t1").style.display="none";
	}
}
</script>
</html>
