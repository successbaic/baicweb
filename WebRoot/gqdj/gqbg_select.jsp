<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.gqdj.GQDJ_JBXX_SQ" %>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="WR0212" scope="page"  class="com.macrosoft.icms.gsnw.WR0212"/>
<%
String SIGN=Page.getSIGN();
String CDDL=Page.getDL();
String sOPETYPE=Page.getOPETYPE();
String sTYPENAME="";
if(sOPETYPE.equals("30")){sTYPENAME="变更";}
if(sOPETYPE.equals("50")){sTYPENAME="注销";}
if(sOPETYPE.equals("81")){sTYPENAME="撤销";}

%>
<html>
<head>
<title>请选择要<%=sTYPENAME %>的股权信息</title>
<script language='javascript'>
function doSub1()
{
	 var regno=document.form1.REGNO.value;
     var entname=document.form1.ENTNAME.value;
     if(regno==""){
		alert("请填写股权所在公司注册号！");
		return ;
	 }
	 if(entname==""){
		alert("请填写股权所在公司名称！");
		return ;
	 }
	document.form2.REGNO.value=regno;
	document.form2.ENTNAME.value=entname;
	form1.submit();
}
function doSub2()
{
	var vID = document.getElementsByName("IDSN");   
	var strs= new Array();  
	for( var i = 0; i < vID.length; i++ )  
	{     
		if ( vID[i].checked )
		{
			strs = vID[i].value.split("|");
			document.form2.NWID.value=strs[0];
			document.form2.NWSN.value=strs[1];
		}  
	} 
    if(typeof(strs[0])=="undefined")
    {
		alert("请诜择记录！");
		return ;
   }
	form2.submit();
}
</script>
</head>
<BODY style="margin: 0px">
<%@include file="../top.inc"%>
<%
StepShow stepShow=new StepShow();
out.println(stepShow.getStep("1",Page.getDL()+Page.getOPETYPE(),Page.getOPENO()));
%>
<br/>
<table border='1' width='100%' align='center'>
<tr>
<td class=lc2 valign='top'>
<font style='font-size:11pt;color:red;font-weight: bold'>
&nbsp;&nbsp;业务办理说明：
</font>
<br/>
&nbsp;&nbsp;
请录入完整的股权所在公司注册号和股权所在公司名称、点击“查询”按钮。在查询列表中“选中”记录进行股权出质<%=sTYPENAME %>申请。如果所填信息与登记信息不符，系统将不予受理！
<br></td></tr></table>
<form name="form1" method="post" acion="gqbg_select.jsp">
<table border="1" width="100%" cellspacing='0' cellpadding='0' align="center">
 <tr>
 <td colspan="2">
    <table id="mc"  border="0" width="100%" cellspacing='0' cellpadding='0' align="center">
    	<input name="mode" type="hidden">
      <tr><td class="yxsm" colspan="5">&nbsp; 待办户信息</td></tr>
      <tr><td class="lc1" align="center" width="10%">注 册 号:</td>
	    <td class="lc2"><input type="text" name="REGNO" id="REGNO" size="30"/></td>
	    <td class="lc1">企业名称: </td>
	    <td class="lc2"><input type="text" name="ENTNAME" id="ENTNAME" size="30"/></td>
	    <td class="lc1"><input type="button" name="button" onclick="doSub1()" value="查 询"/><input type="reset" value="重 置" ></td>
     </tr>
   </table>
  </td>
  </tr>
  </table>
  <table border="1" width="100%" cellpadding="0" cellspacing="0" align="center">
		<tr class='lc1'>
		<td>注册号</td>
		<td>企业名称</td>
		<td>出质人姓名(名称)</td>
		<td>登记时间</td>
		<td>选择</td>
		</tr>	
	 	<%
		if (request.getParameter("mode")!=null)
		{
			String sql=" WHERE 1=1";		
			String sREGNO=WR0212.convertCode(WR0212.doPreProcess(request.getParameter("REGNO")).trim());
			if(!sREGNO.equals(""))
			{
				sql+="  AND trim(ENTERPRISENO)='"+sREGNO+"'";
			}
			String sENTNAME=WR0212.convertCode(WR0212.doPreProcess(request.getParameter("ENTNAME")).trim());
			if(!sENTNAME.equals(""))
			{
				sql+="  AND trim(ENTERPRISENAME)='"+sENTNAME+"'";
			}	
			ArrayList al=WR0212.getList(sql,request.getParameter("start"));	
			Iterator It=al.iterator();
			while (It.hasNext())
			{
			com.macrosoft.icms.gsnw.WR0212 tb=(com.macrosoft.icms.gsnw.WR0212)It.next();
	%>  
			<tr class='lc1'>
				<td><%=tb.getENTERPRISENO()%></td>
				<td><%=tb.getENTERPRISENAME()%></td>
				<td><%=tb.getEXPORG()%></td>
				<td><%=tb.getIMPREQDATE()%></td>
				<td><input type="checkbox" name="IDSN" value="<%=tb.getID()%>|<%=tb.getSN()%>"></td>
			</tr>	
	<%
			}
		}
	%>
	</table>
<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
</form>
<FORM NAME="form2" METHOD="POST" ACTION="gqinfo_select_action.jsp" target="editframe2">
<input type="hidden" name="OPETYPE" value="<%=sOPETYPE%>"/>
<input type="hidden" name="DL" value="<%=CDDL%>"/>
<input type="hidden" name="REGNO"/>
<input type="hidden" name="ENTNAME"/>
<input type="hidden" name="NWID"/>
<input type="hidden" name="NWSN"/>
  <center>
  <div class="subImgs" onclick="doSub2()">下一步</div>  
</<center><iframe height="0" width="0" name="editframe2" src="" id="editframe"></iframe>
</from>
<%@include file="../bottom.inc"%>

</body>
</html>
<%

ValueDefault vf=new ValueDefault();
vf.setFormName("form1");
vf.setData(request);
out.print(vf.ValueDefaultScript());
%>
<script>
//定义“获得指定dom节点”的函数，因为其重用率高
function $(d){return document.getElementById(d);}
var v;
//控制div逐渐显示
var i = 0;
function change_show(){
   var obj = $("Layer2");
   i=i+5; //逐渐显示速度
   obj.style.filter = "Alpha(Opacity=" + i + ")"; //透明度逐渐变小
   obj.style.opacity = i/100; //兼容FireFox
   obj.style.height = i*2 + "px"; //高度逐渐变大
   if(i>=100){
    clearInterval(s);
    i=0;
    $("Layer2").innerHTML=v;
   }
}
//控制change_show()行为
var s;
function show(x,a){
   v=a;
   if(s){clearInterval(s);}
   $(x).innerHTML="";
   $(x).style.display="block";
   s = setInterval(change_show,30);
}
</script>