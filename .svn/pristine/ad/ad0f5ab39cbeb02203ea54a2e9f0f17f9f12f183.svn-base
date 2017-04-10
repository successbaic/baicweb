<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ"/>
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<html>
<head>
<title>指定代表或者共同委托代理人的证明</title>
<script type="" src="<%=request.getContextPath() %>/support/basic.js"></script>
<script type="text/javascript">
	function checkSFZH()
	{		
		var ret=true;
		if (document.form1.CERTYPE.value=="10")	// 身份证
		{
			ret=validatezjhm(document.form1.CERNO.value);
			if(ret){
			
			}else{
				//document.form1.btSave.disabled=false;
			}
		}
		return ret;
	}
	function checkDH(){
		var tel = $.trim($("#TEL").val());
		var mobtel = $.trim($("#MOBTEL").val());
		if(tel=="" && mobtel==""){
			alert("移动电话和固定电话必须至少填写一个！");
			return false;
		}
		return true;
	}
</script>
</head>
<body >
<%@include file="top.inc"%>
<%
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);

	String OPENO =Page.getOPENO();
    String SIGN = Page.getSIGN();	//1查看，2修改   
    String ENTTYPE=Page.getENTTYPE();
 %> 
<form name="form1" method="POST" action='web/qydj_sqwt_action.jsp' target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="SIGN" value=0>
<input type="hidden" name="PRIPID" value="<%=Page.getPRIPID() %>">
<input type="hidden" name="action"  value="1">
<%
if(ENTTYPE.equals("WZGS") || ENTTYPE.equals("WZQY") 
||ENTTYPE.equals("WZFZ") ||ENTTYPE.equals("WGDB") 
||ENTTYPE.equals("WGJY") ||ENTTYPE.equals("WZHH") 
||ENTTYPE.equals("WZHHFZ")){
%>
<!-- <%@ include file="public/qydj_wzsqwt_ini.inc"%> -->
 <%@ include file="public/qydj_sqwt_ini.inc" %>

<%
}else{
%>
 <%@ include file="public/qydj_sqwt_ini.inc" %>
<%}%>
<table width="100%" border=1 cellpadding="0" cellspacing="0" >
<tr>
<td class="lc2">
<font color="red">说明：</font>
日期格式为：yyyy-MM-dd，如：2015-01-12。
</td>
</tr>
</table>
 <br><CENTER>
<div id="waitdiv" style="display:none"><img src="images/blue-loading.gif">
	<br/>
	数据查询中，请等待...<br/>&nbsp;
</div>
 <%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
<%
}else{
%>
<div class="subImgs" id="subid" onclick="if(form1errorCheck()){document.getElementById('subid').disabled=true;document.getElementById('waitdiv').style.display='';document.form1.submit();}">下一页</div>
<%
}
%></CENTER>
</form>
<%@include file="bottom.inc"%>
<iframe height="0" width="100" name="editframe" src="" id="editframe" scrolling="no" border="1" align='center' frameborder="0"></iframe>
</body>      
<IFRAME HEIGHT="0" WIDTH="0" SRC="" NAME="hiddenframe" id="hiddenframe"></IFRAME>
</html>      

<%  
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	ErrorCheck ec = new ErrorCheck();

	ec.setFormName("form1");
	ec.dateOrderCheck("CONFROM","CONTO","有效期限终止日期应该大于等于起始日期!");
	ec.setUserFunction("checkSFZH()");
	ec.setUserFunction("checkDH()");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
	
	QYDJ_SQWT.setOPENO(OPENO);
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();
	vf.setFormData("ENTNAME",QYDJ_JBXX.getENTNAME());
	if(QYDJ_JBXX.getOPETYPE().equals("20")){
		String sAPPPER="";
		String QYLX=icms.getSysRemark("ENTTYPE", QYDJ_JBXX.getENTTYPE());
		if(QYLX.equals("GS") || QYLX.equals("WZGS")){
			sAPPPER="全体股东";
		}else if(QYLX.equals("HZS")){
			sAPPPER="全体成员";
		}else if(QYLX.equals("HHQY") || QYLX.equals("GRDZ")){
			sAPPPER="全体出资人";
		}
		vf.setFormData("APPPER",sAPPPER);
	}else{
		vf.setFormData("APPPER",QYDJ_JBXX.getENTNAME());
	}
		
	vf.setData(QYDJ_SQWT.getData());
	
	out.print(vf.ValueDefaultScript());
%>
 
