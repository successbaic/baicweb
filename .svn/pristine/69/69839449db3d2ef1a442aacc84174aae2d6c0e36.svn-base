<%@ page contentType="text/html;charset=GBK"%>
<%@ page isErrorPage="true"%>
<html>
<LINK href="<%=request.getContextPath()%>/css/icms.css" type="text/css" rel="stylesheet">
<%
	String sClassName=exception.getClass().getName();		//取得类的名字，可以分类处理
	System.out.println( "Error.jsp- Exception Type: " + sClassName );

	//用于生成原始出错信息的IO Stream
	java.io.PrintWriter pw=new java.io.PrintWriter( out );
/*
	//自定义异常类：ICMSException
	if (sClassName.compareTo("com.macrosoft.icms.ICMSException")==0)
	{
		com.macrosoft.icms.ICMSException e=(com.macrosoft.icms.ICMSException)exception;
	}
	//实例初始化错误类
	else if (sClassName.compareTo("java.lang.InstantiationException")==0)
	{
		java.lang.InstantiationException e=(java.lang.InstantiationException)exception;
	}
	//SQLException:数据库错误
	else if (sClassName.compareTo("java.sql.SQLException")==0)
	{
		java.sql.SQLException e=(java.sql.SQLException)exception;
	}

	//空指针错误
	else if (sClassName.compareTo("java.lang.NullPointerException")==0)
	{
		java.lang.NullPointerException e=(java.lang.NullPointerException)exception;
	}
	//其他未处理错误
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
系统提示：
</td>
</tr>
<tr><td>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
您当前的访问不能正常进行！
</td>
</tr>
<tr><td>
<b>具体原因：</b>
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
请稍后<span style="cursor:hand" onclick='javascript:window.history.back();'><font color=blue>重试 </font></span>，
或
<span style="cursor:hand" onclick="parent.window.location.href='ggxkz_ys_list.jsp'"><font color=blue>重新登陆 </font></span>		
</td>
</tr>
</table>

<table id="t1" width="100%" style="display:none">
  <tr>
    <td width="100%" align="center"><b>下面是原始出错信息</b></td>
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
