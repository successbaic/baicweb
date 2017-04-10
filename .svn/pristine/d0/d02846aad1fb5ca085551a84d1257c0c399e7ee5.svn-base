<%@include file="jspheader.inc"%>
<%@ page language="java" contentType="text/html; charset=GBK"%>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<html>
<head>
<title>广告资格检查系统</title>
<script language="javascript">
function doSub(type){
	
	if(type=="2"){
		window.open("GGXKZ_PRINT.jsp");
	}else{
		window.location.href="main.jsp";
	}
}
function doPrint(type){
	
	if(type=="2"){
		window.open("ggxkz_tg_notice.jsp");
	}else{
		window.open("ggxkz_bh_notice.jsp");
	}
}
function funlogout()
{
	if (window.confirm("确定退出广告资格检查系统吗?"))
	{
		window.parent.location.href="ggxkzlogin.jsp";
	}
}
</script>
</head>
<body>
<%
GGGL_JYDW_JBXX.setADBULICNO(GGGL_USER.getADBULICNO());
GGGL_JYDW_JBXX.setINSYEAR(GGGL_USER.getINSYEAR());
GGGL_JYDW_JBXX.doSelect();
String type=GGGL_JYDW_JBXX.getANCHETYPE();

%>
<table width="95%" height="100%" align="center" bgcolor="#D5E2EA">
<tr>
<td height="72px">
<TABLE width="100%" height="72px" cellspacing="0" style="background-image:url(images/main/top-center.jpg)">
  <TR>
    <td align="center">
    <img src="images/main/gggh.jpg"> </td>
    <td align="left">
    <font color="white" style="font-size:28px;font-weight:800;">
    广 告 经 营 许 可 证 资 格 检 查 系 统
    </font>
    </td>
	<td align="right">
	  <table width="200px" height="65px" style="border-style:none">
	    <tr>	    	
		     <TD align="center" style="cursor:pointer">
		      <img src="images/main/usinghelp.png"  onmouseover="sybz.style.color='yellow'" onmouseout="sybz.style.color='white'" onclick="window.open('help.jsp','help','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no');"></img>
		    </TD>
		     <TD align="center" style="cursor:pointer">
		      <img src="images/main/logout.png"  onmouseover="tcxt.style.color='yellow'" onmouseout="tcxt.style.color='white'" onclick="funlogout();"></img>
		    </TD>
		    <td width="50px">&nbsp;</td>
	    </tr>
	     <TR>	     
	      <TD align="center" style="cursor:pointer"><a href="#" onclick="window.open('help.jsp','help','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no');" id="sybz" onmouseover="this.style.color='yellow'" onmouseout="this.style.color='white'">使用帮助</a>
		   </TD>
		  <TD align="center" style="cursor:pointer"><a href="#" onclick="funlogout();" id="tcxt" onmouseover="this.style.color='yellow'" onmouseout="this.style.color='white'">退出系统</a>
		  </TD>
		   <td width="50px">&nbsp;</td>
         </TR>
	  </table>
	</td>   
 </TR> 
</TABLE>
</td>
</tr>
<tr>
<td align="center">
<div style="width:95%;height:98%;background-color:#FFFFFF">
<br/>
<table border="1" width="860px" cellpadding="0" cellspacing="0" align="center">
<tr>
<td colspan="7" align="center" style="font-family: 锟斤拷锟斤拷;font-size: 12pt;line-height: 40px;background-image:url(images/main/bigtitle.jpg);background-repeat:repeat;">
<strong>网 上 广 告 许 可 证 资 格 检 查</strong>
</td>
</tr>
<tr>
<td rowspan="4" width="150px">
<%
if(type.equals("0") || type.equals("3")){
%>
<img src="images/ggxkz/step2_2.gif" onclick="doSub('<%=type%>')">
<%
}
else if(type.equals("")){
%>
<img src="images/ggxkz/step1_2.gif" onclick="doSub('<%=type%>')">
<%
}else if(type.equals("2")){
%>
<img src="images/ggxkz/step3_2.gif" onclick="doSub('<%=type%>')">
<%
}else if(type.equals("1")){
%>
<img src="images/ggxkz/step2_3.gif" onclick="doSub('<%=type%>')">
<%
}
%>

</td>
<td width="100px" class="lc1">广告许可证号：</td>
<td width="150px" class="lc2"><%=GGGL_USER.getADBULICNO()%></td>
<td width="100px" class="lc1">广告经营单位：</td>
<td width="360px" class="lc2"><%=GGGL_USER.getADBUENT()%></td>
</tr>
<tr>
<td class="lc1">法定代表人：</td>
<td class="lc2"><%=GGGL_USER.getLEREP()%></td>
<td class="lc1">住所：</td>
<td class="lc2"><%=GGGL_USER.getDOM()%></td>
</tr>
<tr>
<td class="lc1">年检年度：</td>
<td class="lc2"><%=GGGL_USER.getINSYEAR()%></td>
<td class="lc1">年检状态：</td>
<td class="lc2">
<%
if(type.equals("")){
out.println("尚未填写");
}else if(type.equals("0")){
out.println("尚未提交");
}else if(type.equals("1")){
out.println("等待预审");
}else if(type.equals("2")){
out.println("预审通过");
}else if(type.equals("3")){
out.println("预审驳回");
}
%>
</td>
</tr>
<tr>
<td class="lc1">注意事项：</td>
<td colspan="3" class="lc2">
<%
if(type.equals("") || type.equals("0")){
%>
1、用户登录成功后，<a onclick="doSub('<%=type%>')" style="cursor:pointer;" onmouseover="this.style.fontSize='14px';" onmouseout="this.style.fontSize='12px';"><font color="red">请点击左边的图片</font></a>进行资格检查信息的填写。
如有问题，请查看<a href="#" onclick="window.open('help.jsp','help','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no');" style="cursor:pointer;" onmouseover="this.style.fontSize='14px';" onmouseout="this.style.fontSize='12px';"><font color="red">操作说明</font></a><br/>
2、用户在确认资格检查信息填写完毕无误后向工商行政管理局提交资格检查信息,工商行政管理局将在一定期限内对提交的资格检查信息进行网上预审。<br/>
3、用户在提交年检信息后可通过登录网上资格检查系统查看预审结果。<br/>
&nbsp;&nbsp;&nbsp; A、预审通过：预审通过后，请携带完整的资格检查材料到工商行政管理局办理相关手续。<br> 
&nbsp;&nbsp;&nbsp; B、预审驳回：根据驳回原因进行修改,修改完毕可以重新提交资格检查信息，工商行政管理局将再次进行预审。<br> 
4、预审通过后，必须从网上打印填写好的资格检查信息资料，以及所规定的相关资料到工商行政管理局办理相关手续。<br>
<%}else if(type.equals("1")){
%>
1、信息已提交，请等待工商局业务人员进行预审。<br/>
&nbsp;&nbsp;&nbsp; A、预审通过：预审通过后，请携带完整的资格检查材料到工商行政管理局办理相关手续。<br> 
&nbsp;&nbsp;&nbsp; B、预审驳回：根据驳回原因进行修改,修改完毕可以重新提交资格检查信息，工商行政管理局将再次进行预审。<br>
2、预审通过后，必须从网上打印填写好的资格检查信息资料，以及所规定的相关资料到工商行政管理局办理相关手续。<br>
<%
}else if(type.equals("2")){
%>
1、年检信息预审通过。<a onclick="doSub('<%=type%>')" style="cursor:pointer;" onmouseover="this.style.fontSize='14px';" onmouseout="this.style.fontSize='12px';"><font color="red">请点击左边的图片</font></a>进行资格检查报告书的打印。点击此处<a onclick="doPrint('<%=type%>')" style="cursor:pointer;" onmouseover="this.style.fontSize='14px';" onmouseout="this.style.fontSize='12px';"><font color="red">打印受理通知书</font></a>
如有问题，请查看<a href="#" onclick="window.open('help.jsp','help','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no');" style="cursor:pointer;" onmouseover="this.style.fontSize='14px';" onmouseout="this.style.fontSize='12px';"><font color="red">操作说明</font></a><br/>
2、请从网上打印填写好的资格检查信息资料，以及所规定的相关资料到工商行政管理局办理相关手续。<br>
<%
}else if(type.equals("3")){
%>
1、信息预审驳回，<a onclick="doSub('<%=type%>')" style="cursor:pointer;" onmouseover="this.style.fontSize='14px';" onmouseout="this.style.fontSize='12px';"><font color="red">请点击左边的图片</font></a>进行资格检查信息的修改。点击此处<a onclick="doPrint('<%=type%>')" style="cursor:pointer;" onmouseover="this.style.fontSize='14px';" onmouseout="this.style.fontSize='12px';"><font color="red">打印驳回通知书</font></a>
如有问题，请查看<a href="#" onclick="window.open('help.jsp','help','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no');" style="cursor:pointer;" onmouseover="this.style.fontSize='14px';" onmouseout="this.style.fontSize='12px';"><font color="red">操作说明</font></a><br/>
2、用户在确认资格检查信息填写完毕无误后向工商行政管理局提交资格检查信息,工商行政管理局将在一定期限内对提交的资格检查信息进行网上预审。<br/>
3、用户在提交年检信息后可通过登录网上资格检查系统查看年检预审结果。<br/>
&nbsp;&nbsp;&nbsp; A、预审通过：预审通过后，请携带完整的资格检查材料到工商行政管理局办理相关手续。<br> 
&nbsp;&nbsp;&nbsp; B、预审驳回：根据驳回原因进行修改,修改完毕可以重新提交资格检查信息，工商行政管理局将再次进行预审。<br> 
2、预审通过后，必须从网上打印填写好的资格检查信息资料，以及所规定的相关资料到工商行政管理局办理相关手续。<br>
<%
}%>

</td>
</tr>
<tr>
<td colspan="4">

</td>
</tr>
</table>
</div>

</td>
</tr>
<tr height="28px">
<td style="background-image:url(images/main/bottom.jpg);" colspan="3"></td>
</tr>
</table>
</body>
</html>