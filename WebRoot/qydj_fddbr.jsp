<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="QYDJ_RYXX" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_JBXX" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<html>
<head>
<%
	String OPENO = Page.getOPENO();
  	String SIGN = Page.getSIGN();
	String ENTTYPE = Page.getENTTYPE();
	boolean isCheck = false;
	if ("WZGS".equals(ENTTYPE)) {
		String[] enttype_zwhz = new String[] { "5110", "5210", "5220",
				"6110", "6210", "6220" };
		QYDJ_JBXX.setOPENO(OPENO);
		QYDJ_JBXX.doSelect();

		if (Arrays.asList(enttype_zwhz)
				.contains(QYDJ_JBXX.getENTTYPE())) {
			isCheck = true;
		}
	}
%>
<title>人员信息</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/support/basic.js"></script>
<SCRIPT type="text/javascript">
var isCheck = "<%=isCheck%>";
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
	function getSelDm(id,type){
		var url = "support/doSelDm.jsp?type="+type;
		var info="dialogHeight:580px;dialogLeft:(window.screen.width/100)px;dialogTop:(window.screen.height/100)px;dialogWidth:600px;center:yes;help:no;resizable:no;status:no";
		var ret = window.showModalDialog(url,"",info);
		if(ret!=undefined){
			var testId=id+"_TEXT"
			document.getElementById(id).value=ret[0];
			document.getElementById(testId).value=ret[1];		
		}
	}
	function disabledPosition(){
		$("name=[POSITION]").attr("disabled",true);
	}
	function checkFddbr(){
		if(isCheck == "true"){
			var position = $("select[name='POSITION']").val();
			if(position != "431A" && position != "410A"){
				if (confirm("中外合资企业的法定代表人必须为董事长! "
							+ "\n是否返回修改?")) {
					return false;
				}
			}
		}
		return true;
	}
</SCRIPT>
<style type="text/css">
#yxsm {
   background-image:url(images/main/ywbltitleBG.jpg);
   background-repeat:repeat-x;
}
</style>
</head> 
<body bgcolor="#eefbf7" style="margin-top:0;margin-bottom:0">
&lt;<%@include file="top.inc"%>
<%
	String pageheader=Page.pageheader(request.getRequestURI());
	out.println(pageheader);
	String fddbrFlag="disabled";
	String divflag="block";
	if(SIGN.equals("1")){//已开业的企业
		divflag="none";
 	}
 %>
<form name="form1" method="POST" action='web/qydj_fddbr_action.jsp' target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="PRIPID" value="<%=Page.getPRIPID() %>">
<input type="hidden" id="RECID" name="RECID">
<input type="hidden" name="nextPage" value="<%=Page.getNextPage()[0] %>">
<%String sENTTYPE=Page.getENTTYPE();
  String title="法定代表人信息";
  if(sENTTYPE.equalsIgnoreCase("FGS")||sENTTYPE.equalsIgnoreCase("NZYY")||sENTTYPE.equalsIgnoreCase("WZFZ")
  ||sENTTYPE.equalsIgnoreCase("GRDZFZ")||sENTTYPE.equalsIgnoreCase("HHFZ")||sENTTYPE.equalsIgnoreCase("WZHHFZ")||sENTTYPE.equalsIgnoreCase("HZSFZ"))
  {
     title="负责人信息";
  }else if(sENTTYPE.equalsIgnoreCase("GRDZ"))
  {
     title="投资人信息";
  }else if(sENTTYPE.equalsIgnoreCase("WGDB"))
  {
     title="首席代表信息";
  }else if(sENTTYPE.equalsIgnoreCase("WZHH"))
  {
     title="执行事务合伙人或委派代表";
  }else if(sENTTYPE.equalsIgnoreCase("HHQY"))
  {
     title="执行事务合伙人";
  }%>
<table border="1" width="100%" cellpadding="0" cellspacing="0" style="border-bottom-width:0;">
  <tr>
    <td class="yxsm" align="center">
      <p style="font-color: #000080;font-size: 11pt;font-weight: bold;"><font color=#000080><%=title %></font>           
      </p>
    </td>
  </tr>
</table>
<%if(sENTTYPE.equalsIgnoreCase("GS"))
  {%>
    <%@include file="public/qydj_fddbr_ini.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("FGS")||sENTTYPE.equalsIgnoreCase("NZYY")||sENTTYPE.equalsIgnoreCase("NZFR"))
  {%>
    <%@include file="public/qydj_fzr_ini.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("HHQY")){
%>
 <%@include file="public/qydj_hhqy_fzr.inc" %>
<%
}else if(sENTTYPE.equalsIgnoreCase("HHFZ"))
  {%>
    <%@include file="public/qydj_nzhhfz_fzr.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("WZGS")||sENTTYPE.equalsIgnoreCase("WZQY"))
  {%>
    <%@include file="public/qydj_wzryxx_ini.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("WZFZ"))
  {%>
    <%@include file="public/qydj_wzfzfzr_ini.inc" %> 
<%}else if(sENTTYPE.equalsIgnoreCase("WZFR"))
  {%>
    <%@include file="public/qydj_wzfr_ryxx.inc" %> 
<%}else if(sENTTYPE.equalsIgnoreCase("WGDB"))
  {%>
    <%@include file="public/qydj_wgdb_sxdbxx.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("WGJY"))
  {%> 
    <%@include file="public/qydj_wgjy_fzr.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("WZHH")){ %>
    <%@include file="public/qydj_wzhh_fzr.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("WZHHFZ"))
  {%>
    <%@include file="public/qydj_wzhhfz_fzr.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("GRDZ"))
  {%>
    <%@include file="public/qydj_grdz_tzr.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("GRDZFZ"))
  {%>
    <%@include file="public/qydj_grdzfz_fzr.inc" %>
<%}else if(sENTTYPE.equalsIgnoreCase("HZS")||sENTTYPE.equalsIgnoreCase("HZSFZ"))
  {%>
    <%@include file="public/qydj_hzs_fddbr.inc" %>
<%}%>
<%if(!sENTTYPE.equalsIgnoreCase("FGS")&&!sENTTYPE.equalsIgnoreCase("NZYY")&&!sENTTYPE.equalsIgnoreCase("WZFZ")
  &&!sENTTYPE.equalsIgnoreCase("GRDZFZ")&&!sENTTYPE.equalsIgnoreCase("HHFZ")&&!sENTTYPE.equalsIgnoreCase("WZHHFZ")
  &&!sENTTYPE.equalsIgnoreCase("GRDZ")&&!sENTTYPE.equalsIgnoreCase("WGDB")&&!sENTTYPE.equalsIgnoreCase("WZHH")&&!sENTTYPE.equalsIgnoreCase("HHQY"))
  {%>
<div style="text-align: left;">
	<font color="red" style="font-size: 12px;">
	凡有下列情形之一的人员（除国家另有规定外），不得担任企业法人的法定代表人：</font>
	<br>
	 一、.因违法经营被吊销营业执照的企业原法定代表人，自决定吊销营业执照之日起未满三年的；
	 <br> 
	 二、.因经营管理不善被依法撤销或宣告破产的企业的负有主要责任的法定代表人，自核准注销登记之日起未满三年的； 
	 <br>
	 三、.刑满释放、假释或缓刑考验期满和解除劳教人员，自刑满释放、考验期满或解除劳教之日起未满三年的； 
	 <br>
	 四、.因从事违法活动被司法机关立案调查，尚未结案的； 
	 <br>
	 五、.各级机关（包括党的机关、国家权力机关、行政机关、审判机关、检察机关）在职干部和军队在职现役军人； 
	 <br>
	 六、.国家法律、法规和政策规定不能担任企业领导职务的。
	</font>
</div>
<%} %>
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
<%@include file="bottom.inc"%>
<iframe height="0" width="0" name="editframe" src="" id="editframe" ></iframe> 
<iframe height="0" width="0" src="" name="hiddenframe" id="hiddenframe"></iframe>
</body>     
</html>
 <%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	//ec.dateOrderCheck("OFFHFROM","OFFHTO","任职日期终止日期应该大于等于起始日期!");	
	ec.FormErrorCheck();
	ec.setUserFunction("checkFddbr()");
	ec.setUserFunction("checkSFZH()");
	if(sENTTYPE.equalsIgnoreCase("WGDB")){
		
	}else{
		ec.setUserFunction("checkDH()");
	}
	
	out.print(ec.ErrorCheckScript());
	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	QYDJ_RYXX.setOPENO(OPENO);
	vf.setData(QYDJ_RYXX.getDataByFr());
	vf.setFormData("LEREPSIGN","1");
	vf.setFormData("COUNTRY_TEXT", icms.getSysDm("COUNTRY",QYDJ_RYXX.getCOUNTRY()));
	if(sENTTYPE.equalsIgnoreCase("WGDB")){
		vf.setFormData("POSITION", "491A");
	}
	
 	out.print(vf.ValueDefaultScript());
%>