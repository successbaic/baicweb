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
<title>��Ա��Ϣ</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/support/basic.js"></script>
<SCRIPT type="text/javascript">
var isCheck = "<%=isCheck%>";
	function checkSFZH()
	{		
		var ret=true;
		if (document.form1.CERTYPE.value=="10")	// ���֤
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
			alert("�ƶ��绰�͹̶��绰����������дһ����");
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
				if (confirm("���������ҵ�ķ��������˱���Ϊ���³�! "
							+ "\n�Ƿ񷵻��޸�?")) {
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
	if(SIGN.equals("1")){//�ѿ�ҵ����ҵ
		divflag="none";
 	}
 %>
<form name="form1" method="POST" action='web/qydj_fddbr_action.jsp' target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="PRIPID" value="<%=Page.getPRIPID() %>">
<input type="hidden" id="RECID" name="RECID">
<input type="hidden" name="nextPage" value="<%=Page.getNextPage()[0] %>">
<%String sENTTYPE=Page.getENTTYPE();
  String title="������������Ϣ";
  if(sENTTYPE.equalsIgnoreCase("FGS")||sENTTYPE.equalsIgnoreCase("NZYY")||sENTTYPE.equalsIgnoreCase("WZFZ")
  ||sENTTYPE.equalsIgnoreCase("GRDZFZ")||sENTTYPE.equalsIgnoreCase("HHFZ")||sENTTYPE.equalsIgnoreCase("WZHHFZ")||sENTTYPE.equalsIgnoreCase("HZSFZ"))
  {
     title="��������Ϣ";
  }else if(sENTTYPE.equalsIgnoreCase("GRDZ"))
  {
     title="Ͷ������Ϣ";
  }else if(sENTTYPE.equalsIgnoreCase("WGDB"))
  {
     title="��ϯ������Ϣ";
  }else if(sENTTYPE.equalsIgnoreCase("WZHH"))
  {
     title="ִ������ϻ��˻�ί�ɴ���";
  }else if(sENTTYPE.equalsIgnoreCase("HHQY"))
  {
     title="ִ������ϻ���";
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
	������������֮һ����Ա�����������й涨�⣩�����õ�����ҵ���˵ķ��������ˣ�</font>
	<br>
	 һ��.��Υ����Ӫ������Ӫҵִ�յ���ҵԭ���������ˣ��Ծ�������Ӫҵִ��֮����δ������ģ�
	 <br> 
	 ����.��Ӫ�����Ʊ����������������Ʋ�����ҵ�ĸ�����Ҫ���εķ��������ˣ��Ժ�׼ע���Ǽ�֮����δ������ģ� 
	 <br>
	 ����.�����ͷš����ͻ��̿��������ͽ���ͽ���Ա���������ͷš��������������ͽ�֮����δ������ģ� 
	 <br>
	 �ġ�.�����Υ�����˾�������������飬��δ�᰸�ģ� 
	 <br>
	 �塢.�������أ��������Ļ��ء�����Ȩ�����ء��������ء����л��ء������أ���ְ�ɲ��;�����ְ���۾��ˣ� 
	 <br>
	 ����.���ҷ��ɡ���������߹涨���ܵ�����ҵ�쵼ְ��ġ�
	</font>
</div>
<%} %>
<br>
<CENTER>
<div id="waitdiv" style="display:none"><img src="./images/blue-loading.gif">
	<br/>
	���ݲ�ѯ�У���ȴ�...<br/>&nbsp;
</div>
<%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">��һҳ</div>
<%
}else{
%>
<div class="subImgs" id="subid" onclick="if(form1errorCheck()){document.getElementById('subid').disabled=true;document.getElementById('waitdiv').style.display='';document.form1.submit();}">��һҳ</div>
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
	//ec.dateOrderCheck("OFFHFROM","OFFHTO","��ְ������ֹ����Ӧ�ô��ڵ�����ʼ����!");	
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