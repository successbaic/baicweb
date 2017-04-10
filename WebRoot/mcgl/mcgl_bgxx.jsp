<%@page import="com.macrosoft.icms.gsnw.QYDJ_CZXX_ZS"%>
<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id='MCGL_BGSX' scope='page' class='com.macrosoft.icms.mcgl.MCGL_BGSX_SQ'/>
<jsp:useBean id='MCGL_JBXX_SQ' scope='page' class='com.macrosoft.icms.mcgl.MCGL_JBXX_SQ'/>
<jsp:useBean id="MCGL_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"/>
<jsp:useBean id="QYDJ_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS"/>
<jsp:useBean id="GTDJ_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.GTDJ_JBXX_ZS"/>
<jsp:useBean id="MCGL_TZRXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.MCGL_TZRXX_ZS"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html><head>
<title>名称变更信息</title>
<%
	String ENTCLASS = Page.getENTCLASS();
	boolean gt_isQx = false;
%>
<script type="text/javascript">
function zhcc(lx){
	var ENTTRA ="";
	var TRADPINY="";
	if(lx == "0"){
		ENTTRA = document.form1.ENTTRA.value;
		TRADPINY = document.form1.TRADPINY.value;
	}else if(lx = "1"){
		ENTTRA = document.form1.SPANAME1.value;
		TRADPINY = document.form1.TRADPINY1.value;
	}
	var url="zhcc.jsp?nametype="+document.form1.NAMETYPE.value
			+"&lx="+lx+
			"&djjg="+document.form1.OLDPREREGORG.value
			+"&ENTCLASS="+document.form1.OLDENTCLASS.value
			+"&hy="+document.form1.NAMEIND.value
			+"&ENTTRA="+ENTTRA
			+"&TRADPINY="+TRADPINY;
	window.open(url,'_blank','toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=no,status=yes,left=0,top=0, height=600,width=800 fullscreen=no');
}
function doSub(){
	if(form1errorCheck()){
		document.getElementById("subid").disabled=true;
		document.getElementById("waitdiv").style.display="";
		document.form1.submit();
	}
}
</script>
</head>
<body>
<%@include file="../top.inc"%>
<%	
	String OPENO =Page.getOPENO();
	String PRIPID =Page.getPRIPID();
 	String SIGN =Page.getSIGN();
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	String SPANAME=Page.getXGBH();
	
	MCGL_JBXX_SQ.setOPENO(OPENO);	
	ArrayList mcsqList=MCGL_JBXX_SQ.getData();
	if(SPANAME.equals("")){
		SPANAME=MCGL_JBXX_SQ.getSPANAME();	
	}
	//if(OPENO.equals("")){
	//	MCGL_JBXX_ZS.doSelectBySql("SELECT * FROM MCGL_JBXX_ZS WHERE PRIPID='"+PRIPID+"'");	
	//}else{
	//	MCGL_JBXX_ZS.doSelectBySql("SELECT * FROM MCGL_JBXX_ZS WHERE NAMEID='"+PRIPID+"'");
	//}
	String REGORG = "";
	String OLDNAME = "";
	String sENTTYPE = "";
	if(ENTCLASS.equals("5")){
		GTDJ_JBXX_ZS.setPRIPID(PRIPID);
		GTDJ_JBXX_ZS.doSelect();
		REGORG=GTDJ_JBXX_ZS.getREGORG();
		OLDNAME=GTDJ_JBXX_ZS.getTRANAME();
	}else{
		QYDJ_JBXX_ZS.setPRIPID(PRIPID);
		QYDJ_JBXX_ZS.doSelect();
		OLDNAME=QYDJ_JBXX_ZS.getENTNAME();
		sENTTYPE=icms.getSysRemark("ENTTYPE",QYDJ_JBXX_ZS.getENTTYPE());
		REGORG=QYDJ_JBXX_ZS.getREGORG();
	}
	
	MCGL_JBXX_ZS.doSelectBySql("SELECT * FROM MCGL_JBXX_ZS WHERE PRIPID='"+PRIPID+"'");
	System.out.println();
	
%>
<form name="form1" method="POST" action="mcgl_bgxx_action.jsp" target="editframe">
<table border="1" width="100%" >
<%
if(ENTCLASS.equals("5")){
%>
<caption>[<%=GTDJ_JBXX_ZS.getTRANAME() %>] 名称变更事项</caption>
<input type="hidden" name="OLDENTCLASS" value="<%=MCGL_JBXX_ZS.getENTCAT()%>">
<tr>
	<td class='lc1' rowspan="5">原个体信息</td>
	<td class='lc1'>名 称</td>
	<td class='lc2' colspan="3"><input type="text" name="OLDNAME" value="<%=OLDNAME %>" disabled size="70"></td>
</tr>
<tr>
<td class='lc1'>经营场所</td>
	<td class='lc2' colspan="3"><input type="text" name="OLDDOM" value="<%=GTDJ_JBXX_ZS.getOPLOC() %>" disabled size="70"></td>
</tr>
<tr>
<td class='lc1'>资金数额</td>
<td class='lc2' colspan="3"><input type="text" name="OLDREGCAP" value="<%=GTDJ_JBXX_ZS.getCAPAM() %>" disabled></td>	
</tr>
<%	
}else if(ENTCLASS.equals("6")){
%>
<caption>[<%=QYDJ_JBXX_ZS.getENTNAME() %>] 名称变更事项</caption>
<tr>
	<td class='lc1' rowspan="7">原合作社信息</td>
	<td class='lc1'>合作社名称</td>
	<td class='lc2' colspan="3"><input type="text" name="OLDNAME" value="<%=OLDNAME %>" disabled size="70"></td>
</tr>
<tr>
<td class='lc1'>经营场所</td>
	<td class='lc2' colspan="3"><input type="text" name="OLDDOM" value="<%=QYDJ_JBXX_ZS.getDOM() %>" disabled size="70"></td>
</tr>
<tr>
<td class='lc1'>出资总额</td>
<td class='lc2' colspan="3"><input type="text" name="OLDREGCAP" value="<%=QYDJ_JBXX_ZS.getREGCAP() %>" disabled></td>	
</tr>
<tr>
	<td class='lc1'>企业类别</td>
	<td class='lc2' colspan="3"><select name="OLDENTCLASS" disabled><%=icms.getSysDmList("ENTCLASS") %></select></td>
</tr>
<tr>
	<td class='lc1'>企业类型</td>
	<td class='lc2' colspan="3"><select name="OLDENTTYPE" disabled><%=icms.getSysDmList("ENTTYPE") %></select></td>
</tr>
<%
}else{
%>
<caption>[<%=QYDJ_JBXX_ZS.getENTNAME() %>] 名称变更事项</caption>
<tr>
	<td class='lc1' rowspan="7">原企业信息</td>
	<td class='lc1'>企业名称</td>
	<td class='lc2' colspan="3"><input type="text" name="OLDNAME" value="<%=OLDNAME %>" disabled size="70"></td>
</tr>
<tr>
<td class='lc1'>企业住所</td>
	<td class='lc2' colspan="3"><input type="text" name="OLDDOM" value="<%=QYDJ_JBXX_ZS.getDOM() %>" disabled size="70"></td>
</tr>
<%
if(ENTCLASS.equals("8")){
%>
<tr>
<td class='lc1'>注册资本</td>
<td class='lc2'><input type="text" name="OLDDOM" value="<%=QYDJ_JBXX_ZS.getREGCAP() %>" disabled></td>
<td class='lc1'>币种</td>
<td class='lc2'><select name="OLDREGCAPCUR" disabled><%=icms.getSysDmList("CURRENCY")%></select></td>	
</tr>
<%	
}else{
%>
<tr>
<td class='lc1'>注册资本</td>
<td class='lc2' colspan="3"><input type="text" name="OLDREGCAP" value="<%=QYDJ_JBXX_ZS.getREGCAP() %>" disabled></td>	
</tr>
<%	
}%>
<tr>
	<td class='lc1'>企业类别</td>
	<td class='lc2' colspan="3"><select name="OLDENTCLASS" disabled><%=icms.getSysDmList("ENTCLASS") %></select></td>
</tr>
<tr>
	<td class='lc1'>企业类型</td>
	<td class='lc2' colspan="3"><select name="OLDENTTYPE" disabled><%=icms.getSysDmList("ENTTYPE") %></select></td>
</tr>
<%
}
%>
<tr>
	<td class='lc1'>登记机关</td>
	<td class='lc2' colspan="3">
	<select name="OLDPREREGORG" disabled>
	<%=icms.getBsDjjg(webuser.getXZQH()) %>
	</select></td>
</tr>
<tr>
	<td class='lc1'>经营范围</td>
	<td class='lc2' colspan="3">
	<textarea rows="4" cols="60" disabled name="OLDBUSSCOPE"><%=QYDJ_JBXX_ZS.getBUSSCOPE() %></textarea>
	</td>
</tr>

<tr>
<td class="lc1" rowspan="3">拟变更信息</td>
	<td class='lc1'>冠名类型</td>
	<td class='lc2' colspan="3">
	<select name="NAMETYPE" disblank title="冠名类型">
	<%if(gt_isQx){
	 %>
	 <option value="1">冠区县名（含县级市）</option>
	 <%}else{
	 	if("SHENGJU".equals(ContrInfo.bushumoshi) ){
	 %>
	 	<option value="3">冠省名</option>
	 <%	
	 	}else{
	 	if("ALL".equals(ContrInfo.bushumoshi)){
	 %>
	 	<option value="3">冠省名</option>
	 <%	
	 	}
	  %>
		<option value="2">冠市名</option>
		<option value="1">冠区县名（含县级市）</option>
	<%} 
	  }		
	%>
	</select></td>
</tr>
<tr>
<td class="lc1">拟变更名称</td>
<td class="lc2" colspan="3">
<input type="text" name="ENTNAME" size="70" readonly disblank title="拟变更名称">
&nbsp;<input type="button" class="button" value="字号查重" onclick="zhcc(0)">
<input type="hidden" name="ENTTRA">
<input type="hidden" name="TRADPINY">
<input type="hidden" name="NAMEIND">
</td>
</tr>
<tr>
<td class="lc1">拟变更备选名称</td>
<td class="lc2" colspan="3">
<input type="text" name=ENTNAME1 size="70" readonly>
&nbsp;<input type="button" class="button" value="字号查重" onclick="zhcc(1)">
<input type="hidden" name="TRADPINY1">
<input type="hidden" name="SPANAME1">
</td>
</tr>
<tr>
<td colspan="5">
&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">说明：</font>
变更名称时，请先点击”字号查重“，查重确认后，系统自动生成拟变更企业名称。
</td>
</tr>
</table>

<br>

<%
if(!ENTCLASS.equals("5")){
	if(sENTTYPE.equals("GS")
			||sENTTYPE.equals("WZGS")
			||sENTTYPE.equals("HHQY")
			||sENTTYPE.equals("WZHH")
			||sENTTYPE.equals("HZS")){		
%>
<iframe height="150px" width="100%" align='center' frameborder="0" src="qydj_czxx_zs.jsp?PRIPID=<%=PRIPID %>&ENTCLASS=<%=ENTCLASS%>">
</iframe>
<%	
	}
}
%>


<CENTER>
 <div id="waitdiv" style="display:none"><img src="../images/blue-loading.gif">
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
<div class="subImgs"  id="subid" onclick="doSub()">下一页</div>
<%
}
%>
</CENTER>
<%--为了便于赋值，隐藏域放在最下面 --%>
<input type="hidden" name="CDDL" value="0">
<input type="hidden" name ="PRIPID" value=<%=PRIPID%>>
<input type="hidden" name ="OPENO" value="<%=OPENO%>">
<input type="hidden" name ="SIGN" value="<%=SIGN%>">
<input type="hidden" name="SPANAME" value="<%=SPANAME%>">
<input type="hidden" name="NAMEID" value="<%=MCGL_JBXX_ZS.getNAMEID() %>">
<input type="hidden" name="REGORG" value="<%=REGORG%>">
<input type="hidden" name="STATUS">
</form>
<IFRAME height="0" width="100" name="hiddenframe"  id="hiddenframe"></IFRAME>
<IFRAME height="0" width="100" name="editframe"  id="editframe"></IFRAME>
<%@include file="../bottom.inc"%>
</body>
</html>
<%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();
	out.print(ec.ErrorCheckScript());
%>
<%
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");	
	vf.setFormData("OLDPREREGORG", REGORG);
	if(ENTCLASS.equals("5")){
		vf.setFormData("OLDENTCLASS", MCGL_JBXX_ZS.getENTCAT());	
	}else{
		vf.setFormData("OLDENTCLASS", QYDJ_JBXX_ZS.getENTCAT());
	}
	vf.setFormData("OLDREGCAPCUR", QYDJ_JBXX_ZS.getREGCAPCUR());
	vf.setFormData("OLDENTTYPE", QYDJ_JBXX_ZS.getENTTYPE());	
	if(!gt_isQx){
		if(MCGL_JBXX_ZS.getNAMETYPE().equals("")){
			if(OLDNAME.startsWith("青岛")){
				vf.setFormData("NAMETYPE","2");
			}else{
				vf.setFormData("NAMETYPE","1");
			}
		}else{
			vf.setFormData("NAMETYPE", MCGL_JBXX_ZS.getNAMETYPE());
		}
	}
	if(!OPENO.equals("")){
		vf.setData(mcsqList);
	}
	out.print(vf.ValueDefaultScript());
%>