<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="GTDJ_ZXXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_ZXXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="GTDJ_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.GTDJ_JBXX_ZS"/>
<jsp:useBean id='GTDJ_JBXX_SQ' scope='page' class='com.macrosoft.icms.qydj.GTDJ_JBXX_SQ'/>
<%@include file="top.inc"%>
<%	
	String OPENO =Page.getOPENO();
	String PRIPID =Page.getPRIPID();
 	String sENTTYPE = Page.getENTTYPE();
 	String SIGN =Page.getSIGN();
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
		
	GTDJ_JBXX_ZS.setPRIPID(PRIPID);
	GTDJ_JBXX_ZS.doSelect();

	String checkBox = "□";
    String selected = "√";
    
    String SPANAME1=Page.getXGBH();
	if(SPANAME1.equals("")){
		GTDJ_JBXX_SQ.setOPENO(OPENO);
		GTDJ_JBXX_SQ.doSelect();
		SPANAME1=GTDJ_JBXX_SQ.getSPANAME1();
	}
%>
<html><head>
<title>注销信息</title>
</head>
<body>
<form name="form1" method="POST" action="web/gtdj_zxxx_action.jsp" target="editframe">
<input type="hidden" name = "PRIPID" value=<%=PRIPID%>>
<input type="hidden" name = "ENTTYPE" value=<%=sENTTYPE%>>
<input type="hidden" name = "OPENO" value="<%=OPENO%>">
<input type="hidden" name = "OPETYPE" value="50">
<input type="hidden" name = "SIGN" value="<%=SIGN%>">
<input type="hidden" name="REGORG" value="<%=GTDJ_JBXX_ZS.getREGORG() %>">
<input type="hidden" name="STATUS" value="">
<input type="hidden" name="TYPE" value="2">
<input type="hidden" name="SPANAME1" value="<%=SPANAME1%>">
<table border="1" cellpadding="0" cellspacing="0" width="100%">	
<tr>
<td class="yxsm" colspan="6" align="center">&nbsp;个体工商户注销信息</td> 
</tr>
   <tr class="lc1">
    <td width="15%"  class="lc1" align="center" width="20%">注册号</td>
    <td width="35%"  class="lc2" width="20%" colspan=2><%=GTDJ_JBXX_ZS.getREGNO() %></td>
    <td width="15%"  class="lc1" align="center" width="20%">名称</td>
    <td width="35%"  class="lc2" colspan=2 width="40%"><%=GTDJ_JBXX_ZS.getTRANAME() %></td>
   </tr>   
   <tr class="lc1">
    <td width="15%"  class="lc1" align="center" width="20%">统一社会信用代码</td>
    <td width="35%"  class="lc2" width="20%" colspan=5><%=GTDJ_JBXX_ZS.getUNISCID()%></td>
   </tr>   
  <tr class="lc1">
    <td class="lc1" align="center" nowrap=nowrap>注销原因</td>
    <td colspan=5 class="lc2">
       <select name="CANREGREA" size="" style="width:200px">
          <option></option><%=icms.getSysDmList("TRACANREA") %>
       </select><font color=red>*</font>
    </td>
  </tr>
  <tr class="lc1">
    <td class="lc1" align="center" nowrap=nowrap>清税证明文号</td>
    <td colspan=2 class="lc2">
    <input type="text" name="QSZMWH" title="清税证明文号" style="width:200px"/>
    </td>
     <td class="lc1" align="center" nowrap=nowrap>清税证明开具时间</td>
    <td class="lc2">
    <input type="text" name="QSZMKJTIME" title="清税证明开具时间" style="width:200px"disblank  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})" datatype="DATE"/>
    </td>
  </tr>
  <tr class="lc1">
    <td class="lc1" align="center" nowrap=nowrap>主管税务机关</td>
    <td colspan=5 class="lc2">
    <input type="text" name="ZGSYJG" title="主管税务机关" style="width:200px"/>
    </td>
  </tr>
  <tr class="lc1">
    <td class="lc1" align="center">备注</td>
    <td class="lc2" colspan="5">
        <textarea rows="5" name="REMARK" maxlength=200 cols="89" title="备注"></textarea>
    </td>
  </tr>
</table>
<br>
<CENTER>
<div id="waitdiv" style="display:none"><img src="./images/blue-loading.gif">
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
%>
</CENTER>
</form>
<IFRAME height="0" width="100" name="editframe"  id="editframe"></IFRAME>
<%@include file="bottom.inc"%>
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
	GTDJ_ZXXX.setOPENO(OPENO);
	vf.setData(GTDJ_ZXXX.getData());
	out.print(vf.ValueDefaultScript());
%>