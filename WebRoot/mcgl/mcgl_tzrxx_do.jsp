<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="MCGL_TZRXX" scope="page"  class="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ"/>
<jsp:useBean id="MCGL_JBXX" scope="page"  class="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ"/>
<html>
<head>
<title>��˾�ɶ��������ˣ�������Ϣ</title>
<%
 	// String OPENO =Page.getpageKey();
	String action = SysUtility.doPreProcess(request.getParameter("action"));
  	String RECID = SysUtility.doPreProcess(request.getParameter("RECID"));
  	String OPENO = SysUtility.doPreProcess(request.getParameter("OPENO"));
  	String ENTTYPE = Page.getENTTYPE();
	String ENTCLASS=Page.getENTCLASS();
	//MCGL_TZRXX.setOPENO(OPENO);
	//MCGL_TZRXX.setRECID(Integer.parseInt(RECID));
	//MCGL_TZRXX.doSelect();
	MCGL_JBXX.setOPENO(OPENO);
	MCGL_JBXX.doSelect();
 %>
<script language="javascript" src="<%=request.getContextPath() %>/support/basic.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/support/trees/js/tree.js"></script>
<script LANGUAGE="JavaScript">
	var ENTCLASS = "<%=ENTCLASS%>";
function getSelDm(id,type){
	var url = "../support/doSelDm.jsp?type="+type;
	if(ENTCLASS == "8" && id == "COUNTRY"){
		if($("#INVTYPE").length>0){
			if($("#INVTYPE").val().indexOf("3") == 0){
				url = "../support/doSelDm.jsp?noChinese=1&type="+type;
			}
		}
	}
	var info="dialogHeight:580px;dialogLeft:(window.screen.width/100)px;dialogTop:(window.screen.height/100)px;dialogWidth:600px;center:yes;help:no;resizable:no;status:no";
	var ret = window.showModalDialog(url,"",info);
	if(ret!=undefined){
		var testId=id+"_TEXT"
		document.getElementById(id).value=ret[0];
		document.getElementById(testId).value=ret[1];
		
		if(id=="CONGROCUR"){
			document.getElementById("REGCAPCUR").value=ret[0];
			$("#REGCAPCUR_TEXT").val(ret[1]);
			//document.getElementById("REGCAPCUR_TEXT").value=ret[1];
		}
	}
}
function INVTYPEChange(){
	if($("#INVTYPE").length>0){
		$("#INVTYPE").change(function(){
			setInIitem();
		});
	}
}

	function checkSFZH()
	{		
		var ret=true;
		if(document.form1.CERTYPE!=null){
			if (document.form1.CERTYPE.value=="10")	// ���֤
			{
				ret=validatezjhm(document.form1.CERNO.value);
				if(ret){
				
				}else{
					document.form1.btSave.disabled=false;
				}
			}
		}
		return ret;
	}
	function checkInvtype(){
	var val=document.form1.INVTYPE.value;
	if(val == ""){
		alert("��ѡ��Ͷ�������ͣ�");
		document.form1.btSave.disabled=false;
		return false;
	}
	/*
		var val=document.form1.INVTYPE.value;
		var ENTTYPE=document.form1.ENTTYPE.value;
		var ret=true;
		if(val=="10"){
			alert("���˹ɶ���ѡ��������ͣ��硰��ҵ���ˡ�������ҵ���ˡ��������ŷ��ˡ��������ط��ˡ���");
			ret= false;
		}
		if(val=="20"){
			alert("��Ȼ�˹ɶ���ѡ��������ͣ��硰ũ����Ȼ�ˡ�������ũ����Ȼ�ˡ���");
			ret= false;
		}
		if(val=="30"){
			alert("���(����)Ͷ������ѡ��������ͣ��硰���(����)��ҵ���������(����)������֯����������Ͷ��Ͷ���Թ�˾����������Ͷ�ʴ�ҵͶ����ҵ�������⼮��Ȼ�ˡ��������ȡ���");
			ret= false;
		}
		if(ENTTYPE=="1151"){
			if (val=="20"||val=="35"||val=="36" || val=="21" || val=="22"){
				
			}else{
				alert("��ǰ���Ƶ���ҵ�����ǡ��������ι�˾(��Ȼ�˶���)������ѡ���Ͷ�����������ڷ���Ȼ��");
				ret= false;
			}
		}
		if(ENTTYPE=="1152"||ENTTYPE=="1153"){
			//if (val=="20"||val=="35"||val=="36" || val=="21" || val=="22"){
			//	alert("��ǰ���Ƶ���ҵ�����ǡ��������ι�˾(���˶���)������ѡ���Ͷ��������������Ȼ��");
			//	ret= false;
			//}else{
			//	
			//}
		}
		if(!ret){
			
		}
		return ret;
		*/
	}
	var option10;
	var option20;
	var option30;
	function setInIitem()
	{	
		if($("#CERTYPE").length>0){
			if(option10 == null){
				option10 = $("#CERTYPE option[value='10']");
				option20 = $("#CERTYPE option[value='20']");
				option30 = $("#CERTYPE option[value='30']");
			}
		}
		var val=document.form1.INVTYPE.value;		
		document.getElementById("ZJLX_TR").style.display="none";
		document.getElementById("ZZLX_TR").style.display="none";
		if (val=="20"||val=="35"||val=="36" || val=="21" || val=="22")
		{			
			if($("#CERTYPE").length>0){
				if(val == "35"||val=="36"){
					option10.remove();
					option20.remove();
					option30.remove();
				}else{
					option10.appendTo("#CERTYPE");
					option20.appendTo("#CERTYPE");
					option30.appendTo("#CERTYPE");
				}
			}	
			
			document.form1.BLICTYPE.value="";
			document.form1.BLICNO.value="";
			document.getElementById("ZJLX_TR").style.display="";
		}
		else
		{
			document.form1.CERTYPE.value="";
			document.form1.CERNO.value="";
			document.getElementById("ZZLX_TR").style.display="";
		}		
	}
</script>	
</head> 
<body>
<form name="form1" method="POST" action="mcgl_tzrxx_action.jsp" target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="RECID" value=<%=RECID%>>
<input type="hidden" name="ENTTYPE" value=<%=MCGL_JBXX.getENTTYPE() %>>
<input type="hidden" name="action" value="<%=action%>">
<input type="hidden" name="JB_REGCAP" id="JB_REGCAP" value=<%=MCGL_JBXX.getREGCAP()%>>
<input type="hidden" name="REGCAPCUR" id="REGCAPCUR" value=<%=MCGL_JBXX.getREGCAPCUR()%>>
<%
if(ENTCLASS.equals("1") || ENTCLASS.equals("2")){
%>
<%@ include file="../public/mcgl_nz_tzrxx.inc" %>
<%	
}else if(ENTCLASS.equals("8")){
%>
<%@ include file="../public/mcgl_wz_tzrxx.inc" %>
<%
}else if(ENTCLASS.equals("6")){
%>
<%@ include file="../public/mcgl_hzs_tzrxx.inc" %>
<%
}
%>
<br>
<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td align=center>
<%
		if (action.equals("4"))
		{
%>
		<input name="btRet" type="button" value="��  ��" onclick="parent.document.getElementById('editDiv').style.display='none';" class="butontType">
<%
		}
		else
		{
		%>
		<input name="btSave" type="submit" value="��  ��" class="butontType">
		<%
		}
		%>
		</td>
	</tr>
</table>
</form>
<iframe height="0" width="0" name="editframe" src="" id="editframe" ></iframe> 
<iframe height="0" width="0" src="" name="hiddenframe" id="hiddenframe"></iframe>
</body>     
</html>
 <%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");	
	ec.setUserFunction("checkInvtype()");
	ec.FormErrorCheck();
	ec.setUserFunction("checkSFZH()");
	if(ENTCLASS.equals("1") || ENTCLASS.equals("2") || ENTCLASS.equals("8")){
		ec.setUserFunction("doblurcongro()");
	}
	out.print(ec.ErrorCheckScript());

	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
	if(action.equals("2")||action.equals("4")){
		MCGL_TZRXX.setRECID(RECID);
		MCGL_TZRXX.setOPENO(OPENO);
		vf.setData(MCGL_TZRXX.getData());
		if(ENTCLASS.equals("8")){
			vf.setFormData("CONGROCUR_TEXT", icms.getSysDm("CURRENCY", MCGL_TZRXX.getCONGROCUR()));
			vf.setFormData("REGCAPCUR_TEXT", icms.getSysDm("CURRENCY", MCGL_TZRXX.getREGCAPCUR()));
			vf.setFormData("COUNTRY_TEXT", icms.getSysDm("COUNTRY", MCGL_TZRXX.getCOUNTRY()));	
		}		
		vf.setUserFunction("setInIitem()");
		vf.setUserFunction("INVTYPEChange()");
	}else{
		if(ENTCLASS.equals("8")){
			vf.setFormData("CONGROCUR_TEXT", icms.getSysDm("CURRENCY", MCGL_JBXX.getCONGROCUR()));
			vf.setFormData("CONGROCUR", MCGL_JBXX.getCONGROCUR() );	
		}	
		vf.setUserFunction("INVTYPEChange()");
	}
	
 	out.print(vf.ValueDefaultScript());
%>