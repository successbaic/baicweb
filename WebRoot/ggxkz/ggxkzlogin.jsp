<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
  <head>
    <title>��澭Ӫ����ʸ���</title>
    <script language="javascript">
    	function doSbu(){
    		var name=document.form1.NAME.value;
    		var pass=document.form1.PASS.value;
    		if(name==""){
    			alert("��¼���û�����");
    			return;
    		}
    		if(pass==""){
    			alert("��¼�����룡");
    			return;
    		}
    		document.form1.submit();
    	}
    </script>
 </head>
<body>
<%
java.util.Date date=new java.util.Date();
int sINSYEAR=date.getYear()+1899;
session.invalidate();
%>
<form name="form1" action="logined.jsp" method="POST" target="editframe">
<br/><br/>
<table width=765 border=0 cellSpacing=0 cellPadding=0 align="center">
<tr height=70>
<td width="205px" style="background-image:url(images/ggxkz/index_r1_c1.jpg);"></td>
<td width="560px" style="background-image:url(images/ggxkz/index_r1_c2.jpg);"></td>
</tr>
</table>
<table width=765 border=0 cellSpacing=0 cellPadding=0 align="center">
<tr>
<td rowspan="3" width="300px" height="279px" style="background-image:url(images/ggxkz/index_r2_c1.jpg);"></td>
<td width="465px" align="center">
<p style="line-height:30px">
 <font style="font-size:20px;font-weight:800;">�� �� �� Ӫ �� λ �� �� �� Ӫ �� �� �� ��</font>
<br/>
 <font style="font-size:22px;font-weight:800;"> �� �� �� �� ϵ ͳ</font>
</p> 
</td>
</tr>
<tr>
<td>
	<table width="356" height="175px" style="background-image:url(images/ggxkz/index_r4_c4.jpg);background-repeat:no-repeat;" align="center">
	<tr>
	<td align="center" style="line-height:170px">
		<table width="100%">
			<tr>
				<td align="right">
				<font style="font-size:12px">��澭Ӫ��λ��</font>
				</td>
				<td align="left">
				<input type="text" name="NAME" style="BORDER-BOTTOM: 1px solid; BORDER-LEFT: 1px solid; BORDER-TOP: 1px solid; BORDER-RIGHT: 1px solid">
				</td>
			</tr>
			
			<tr>
				<td align="right">
				<font style="font-size:12px">��Ӫ���֤�ţ�</font>
				</td>
				<td align="left">
				<input type="text" name="PASS" style="BORDER-BOTTOM: 1px solid; BORDER-LEFT: 1px solid; BORDER-TOP: 1px solid; BORDER-RIGHT: 1px solid">
				</td>
			</tr>
			
			<tr>
				<td align="right">
				<font style="font-size:12px"> �� �� �� �ȣ�</font>
				</td>
				<td align="left">
				<input type="text" style="width:60px;border-right-style: none;border-right-width:none;border-left-style: none;border-left-width:none;" readonly name="INSYEAR" value="<%=sINSYEAR%>">
				</td>
			</tr>
			
			<tr>
				<td align="center" colspan="2">
				<input type="button" value="�� ¼" onclick="doSbu()">
				&nbsp;&nbsp;
				<input type="reset" value="ȡ ��">
				</td>
			</tr>
		</table>
		
	</td>
	</tr>
	</table>	
</td>
</tr>
<tr>
<td align="center" style="cursor:pointer">
<img src="images/ggxkz/007.gif" onclick="window.open('help.jsp','help','toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no');">
<font style="font-size:12px"><a onclick="window.open('help.jsp','help','toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no');">ʹ��˵��</a></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="images/ggxkz/008.gif">
<font style="font-size:12px">��ϵ�绰</font>
</td>
</tr>
</table>
<table width=765 border=0 cellSpacing=0 cellPadding=0 align="center">
<tr height=70>
<td width="552px" style="background-image:url(images/ggxkz/index_r8_c7.jpg);">
&nbsp;
&nbsp;
<font color="white" style="font-size:12px">
Copyright @2012 ɽ��ʡ�������������
&nbsp;&nbsp;&nbsp;&nbsp;
����ʹ��IE6.0��1024*768���Ϸֱ��������վ
</font>
</td>
<td width="213px" style="background-image:url(images/ggxkz/index_r8_c8.jpg);" align="right">
</td>
</tr>
</table>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe" ></iframe> 
</body> 
</html>    