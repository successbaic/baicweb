<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="GSGSJIN_BASIS02" scope="page"  class="com.macrosoft.icms.gsnw.GSGSJIN_BASIS02"/>
<jsp:useBean id="GSGSJIN_SUB02" scope="page"  class="com.macrosoft.icms.gsnw.GSGSJIN_SUB02"/>
<jsp:useBean id="WR0211" scope="page"  class="com.macrosoft.icms.gsnw.WR0211"/>
<jsp:useBean id="GQDJ_JBXX" scope="page"  class="com.macrosoft.icms.gqdj.GQDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%@ page import="com.macrosoft.icms.util.CHECK_INFO" %>
<html>
<head>
<title></title>
</head>
<body>
<%
	String REGNO=SysUtility.doPreProcess(request.getParameter("REGNO"));	//注册号
	String CERNO=SysUtility.doPreProcess(request.getParameter("CERNO"));   //证件号码
	String FILENO=SysUtility.doPreProcess(request.getParameter("FILENO")); //出质登记编号
	String NWID=SysUtility.doPreProcess(request.getParameter("NWID")); //内网股权出质ID
	String NWSN=SysUtility.doPreProcess(request.getParameter("NWSN"));//内网股权出质SN
	String MORREGNO=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("MORREGNO")));	
	String CDDL=SysUtility.doPreProcess(request.getParameter("CDDL"));    //大类为4 股权出质业务
	String OPETYPE=SysUtility.doPreProcess(request.getParameter("OPETYPE"));//小类为20 股权出质登记业务
	
	String ENTNAME="";
	String PRIPID="";
	String HOLDERTYPE="";
	String HOLDERSHARE="";
	String FIELD001="";
	//String strsql="SELCT COUNT(*) FROM QYDJ_YWSB_SQ WHERE CDDL='4' AND STATUS<4 AND REGNO='"+REGNO+"'";
	//int count=QYDJ_YWSB.getListCount("CDDL='4' AND STATUS<4 AND REGNO='"+REGNO+"'")
	CHECK_INFO CHECKINFO =new CHECK_INFO();
	String strSQL="SELECT COUNT(*) FROM QYDJ_YWSB_SQ WHERE REGNO='"+REGNO+"' AND STATUS!='4' AND CDDL='4'";
	String wwywsbInfo=CHECKINFO.WW_YWSB_SQ_BYSQL(strSQL,"该公司的股东正在办理网上登记业务！");
	if(!wwywsbInfo.equals("")){
		out.print(SysUtility.setAlertScript(wwywsbInfo,""));

		return;
	}
	if(OPETYPE.equals("20"))
	{
		GSGSJIN_BASIS02.doSelectBySql("SELECT * FROM GSGSJIN_BASIS02 WHERE FIELD002 IN('020101','020201','020301') AND trim(FIELD004)='"+REGNO+"' AND FIELD006 IN ('1','4')");
		PRIPID=GSGSJIN_BASIS02.getFIELD003();//NBXH
		FIELD001=GSGSJIN_BASIS02.getFIELD001();//与人员信息表关联ID
		ENTNAME=GSGSJIN_BASIS02.getFIELD009();
		
		if(PRIPID.equals("")){
			out.print(SysUtility.setAlertScript("注册号不存在或当前企业已注吊销，请保证注册号的准确及完整性，并重新输入！",""));
		       return;
		}
		
		String frsql="SELECT * FROM GSGSJIN_SUB02 WHERE FIELD001='"+FIELD001+"' AND FIELD002='sub02_02'";  //法人
		GSGSJIN_SUB02.doSelectBySql(frsql);
		//if(QYLX.equals("WZFZ")){
		//	frnum=GSGSJIN_SUB02.getFIELD020();
		//}else{
		String FIELD053=GSGSJIN_SUB02.getFIELD053(); //法人或负责人注册号
		HOLDERTYPE=GSGSJIN_SUB02.getFIELD002();//股东类型
		HOLDERSHARE=GSGSJIN_SUB02.getFIELD065();//拥有权益（万元）
		//}frnum
		if(!CERNO.equals(FIELD053)){
			out.print(SysUtility.setAlertScript("法定代表人（负责人）的证件号码与登记信息不一致，请检查！",""));
			return;
		}
		//OPENO=GQDJ_JBXX.doIFSelect(PRIPID,ENTNAME);
		Page.setPRIPID(PRIPID);//NBXH
		Page.setXGBH(CERNO); //证件号码
		Page.setREGNO(REGNO);
		Page.setENTNAME(ENTNAME);
		Page.setOPETYPE(OPETYPE);	
		Page.setpageKey(FIELD001);
	}
	else if(OPETYPE.equals("30")||OPETYPE.equals("50")||OPETYPE.equals("81"))
	{
		WR0211.setID(NWID);
		WR0211.doSelect();
		
		Page.setXGBH(NWID);//内网股权出质ID
		Page.setpageKey(NWSN);//内网股权出质SN
		Page.setPRIPID(WR0211.getNBXH());
	}

	out.print("<script language='javascript'>parent.window.location.href='wsdj_gqdj_tbxx.jsp'</script>");
%>
</body>
</html>
