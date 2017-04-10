<%@ page contentType="text/html;charset=GBK"%> 
<%@ include file="../jspheader.inc"%>
<%@ page import="com.macrosoft.icms.gsnw.GSYJXX" %> 
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ">
	<jsp:setProperty name="QYDJ_RYXX" property="*"/>
</jsp:useBean>
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_YWSB_SQ" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<html>
<head>
	<script type="text/javascript">

	</script>
</head>

<%	
	String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	boolean bl=false;
	String OPENO = QYDJ_RYXX.doPreProcess(request.getParameter("OPENO"));
	
	String CERNO = QYDJ_RYXX.doPreProcess(request.getParameter("CERNO"));
	String CERTYPE = QYDJ_RYXX.doPreProcess(request.getParameter("CERTYPE"));
	String INAME = new String(request.getParameter("NAME").getBytes("ISO8859-1"),"GBK");
//	if(Page.getOPETYPE().equals("20") || Page.getOPETYPE().equals("30")){
		GSYJXX yjxx=new GSYJXX();
		if(yjxx.checkRyHmd(CERNO,CERTYPE)){
			out.print(SysUtility.setAlertScript("当前人员的身份证号码在黑名单库中!","parent.window.location.reload();"));
			return;
		}
		if(Page.getENTTYPE().equals("GS")||Page.getENTTYPE().equals("WZGS")||Page.getENTTYPE().equals("NZFR")||Page.getENTTYPE().equals("HZS")){
			if(yjxx.checkLaolai(INAME, CERNO)){
				out.print(SysUtility.setAlertScript("提示:当前人员在失信被执行人名单中!","parent.window.location.reload();"));
				return;
			}
		}
//	}
	//int max =QYDJ_RYXX.getListMax(" where OPENO='"+OPENO+"'");if(max>0){max=max+1;}
	QYDJ_RYXX.setLEREPSIGN("1");
	if(QYDJ_RYXX.doCountByFr()){
		bl=QYDJ_RYXX.doModify();
	}else{
		QYDJ_RYXX.setRECID(SysUtility.getUUID20());
		bl=QYDJ_RYXX.doAdd();
	}
	if(bl){
		String NAME = QYDJ_RYXX.doPreProcess(request.getParameter("NAME"));
		QYDJ_JBXX.setOPENO(OPENO);
		QYDJ_JBXX.doSelect();
		QYDJ_JBXX.setLEREP(NAME);
		QYDJ_JBXX.setPOSITION(QYDJ_RYXX.doPreProcess(request.getParameter("POSITION")));
		QYDJ_YWSB_SQ.setOPENO(OPENO);
		QYDJ_YWSB_SQ.doSelect();
		QYDJ_YWSB_SQ.setLEREP(QYDJ_YWSB_SQ.doPreProcess(request.getParameter("NAME")));
		if(QYDJ_JBXX.doModify()&&QYDJ_YWSB_SQ.doModify()){
			out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.href='../"+request.getParameter("nextPage")+"';"));
		}else{
			out.print(SysUtility.setAlertScript("数据保存失败!",parentOption));
		}
	}else{
		out.print(SysUtility.setAlertScript("数据保存失败!",parentOption));
	}
%>
</html>
<body>