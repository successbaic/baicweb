<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_CZXX" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="QYDJ_JBXX" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<html>
<head>
<title>公司股东（发起人）出资信息</title>
<script language="javascript" src="<%=request.getContextPath() %>/support/basic.js"></script>
<script type="text/javascript">
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
function setInIitem()
{
	var val=document.form1.INVTYPE.value;		
	document.getElementById("ZJLX_TR").style.display="none";
	document.getElementById("ZZLX_TR").style.display="none";
	if (val=="20"||val=="35"||val=="36" || val=="21" || val=="22")
	{			
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

<body bgcolor="#eefbf7" style="margin-top:0;margin-bottom:0">
<%@include file="top.inc"%>
<%
String SIGN = Page.getSIGN();
String OPENO = Page.getOPENO();
String sENTTYPE = Page.getENTTYPE();
String pageheader=Page.pageheader(request.getRequestURI());
out.println(pageheader);
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.doSelect();	
 %>
<form name="form1" method="POST" action='web/qydj_czxx_nzfr_action.jsp' target="editframe">
<input type="hidden" name="OPENO" value=<%=OPENO%>>
<input type="hidden" name="PRIPID" value="<%=Page.getPRIPID() %>">
<input type="hidden" id="RECID" name="RECID">
<input type="hidden" name="REGCAP" id="REGCAP" value=<%=QYDJ_JBXX.getREGCAP()%>>
<input type="hidden" name="ENTTYPE" value="<%=QYDJ_JBXX.getENTTYPE() %>">
<input type="hidden" name="nextPage" value="<%=Page.getNextPage()[0] %>">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
<caption></caption>
</table>
	<%@include file="public/qydj_nzfr_czxx.inc" %>
<br>
<CENTER>
<%
if(SIGN.equals("1")){
%>
<div class="subImgs" onclick="window.location.href='<%=Page.getNextPage()[0] %>'">下一页</div>
<%
}else{
%>
<div class="subImgs" onclick="if(form1errorCheck()){document.form1.submit();}">下一页</div>
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

<SCRIPT LANGUAGE="JavaScript">
	function checkSFZH()
	{		
		var ret=true;
		if(document.form1.CERTYPE!=null){
			if (document.form1.CERTYPE.value=="10")	// 身份证
			{
				ret=validatezjhm(document.form1.CERNO.value);
				if(ret){
				
				}else{
					document.form1.btSave.disabled=false;
				}
			}
			return ret;	
		}		
	}
	function invdis(){//投资人姓名、类型、证件类型、证件号码、证照类型、证照号码不允许修改
	   document.form1.INV.disabled=true;
	   //document.form1.INVTYPE.disabled=true;
	   //document.form1.CERTYPE.disabled=true;
	   //document.form1.CERNO.disabled=true;
	   //document.form1.BLICTYPE.disabled=true;
	   //document.form1.BLICNO.disabled=true;
	}
	function doSetRemark(){
	   var type=document.form1.INVTYPE.value;
	   if(type!=""&&type!=null){
	      if(type=="10"||type=="11"||type=="15"||type=="40"||type=="50"){
	         document.form1.REMARK.value="A";
	      }else if(type=="13"){
	         document.form1.REMARK.value="B";
	      }else if(type=="12"){
	         document.form1.REMARK.value="C";
	      }else if(type=="14"){
	         document.form1.REMARK.value="D";
	      }else if(type=="20"||type=="21"||type=="22"||type=="35"||type=="36"){
	         document.form1.REMARK.value="E";
	      }else{
	         document.form1.REMARK.value="G";
	      }
	   }
	}
</SCRIPT>

 <%
	ErrorCheck ec = new ErrorCheck();
	ec.setFormName("form1");
	ec.FormErrorCheck();	
	out.print(ec.ErrorCheckScript());


	ValueDefault vf=new ValueDefault();
	vf.setFormName("form1");
		QYDJ_CZXX.setOPENO(OPENO);
		vf.setData(QYDJ_CZXX.getDataByOpeno());
 	out.print(vf.ValueDefaultScript());
%>