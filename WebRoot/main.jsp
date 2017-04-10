<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.SysUtility" %>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ" %>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%
String CDDL=SysUtility.doPreProcess(request.getParameter("CDDL"));
String OPETYPE=SysUtility.doPreProcess(request.getParameter("OPETYPE"));
String OPENO=SysUtility.doPreProcess(request.getParameter("OPENO"));
String SIGN=SysUtility.doPreProcess(request.getParameter("SIGN"));
String STEP=SysUtility.doPreProcess(request.getParameter("STEP"));
String ENTTYPE=SysUtility.doPreProcess(request.getParameter("ENTTYPE"));
String url="";
if(CDDL.equals("0")){
	//OPETYPE="10";
	System.out.println("OPETYPE="+OPETYPE);
	if(STEP.equals("0")){
		if(OPETYPE.equals("10")){
		  url="mcgl/mcgl_tbxx.jsp";
		}else if(OPETYPE.equals("13")){
		  url="mcgl/qymcbg_select.jsp";
		}else{
		  url="mcgl/mcbg_select.jsp";
		}
	}else{
		if(OPETYPE.equals("10")){
		  url="mcgl/mcgl_control.jsp";
		}else{
		  url="mcgl/mcbg_control.jsp";
		}
	}
}else if(CDDL.equals("1")){
	if(STEP.equals("0")){
		if(OPETYPE.equals("20")){
			url="qysl_select.jsp";
		}else{
			url="qybg_select.jsp";
		}
	}else{
		url="qydj_control.jsp";
	}
}else if(CDDL.equals("2")){
	if(STEP.equals("0")){
		if(OPETYPE.equals("20")){
			url="gtsl_select.jsp";
		}else{
			url="gtbg_select.jsp";
		}
	}else{
		url="qydj_control.jsp";
	}
}else if(CDDL.equals("3")){
	if(STEP.equals("0")){
		if(OPETYPE.equals("20")){
			url="nmsl_select.jsp";
		}else{
			url="qybg_select.jsp";
		}
	}else{
		url="qydj_control.jsp";
	}
}
else if(CDDL.equals("4"))
{
	if(STEP.equals("0"))
	{
		if(OPETYPE.equals("20"))
		{
			url="gqdj/gqsl_select.jsp";
		}
		else
		{
			url="gqdj/gqbg_select.jsp";
		}
	}
	else
	{
		url="gqdj/gqdj_control.jsp";
	}
}else if(CDDL.equals("5")){
	if(STEP.equals("0")){
		if(OPETYPE.equals("20")){
			url="hwgg/hwgg_xgcl.jsp";
		}else{
			url="hwgg/hwgg_gginfo.jsp";
		}
	}else{
		url="hwgg/hwgg_control.jsp";
	}
}else if(CDDL.equals("61")){
	if(STEP.equals("0")){
		if(OPETYPE.equals("20")){
			url="htgl/htgl_qyinfo.jsp";
		}else if(OPETYPE.equals("30")){
			url="htgl/htgl_dcdyinfo.jsp";
		}else if(OPETYPE.equals("50")){
			url="htgl/htgl_dcdyinfo.jsp";
		}else if(OPETYPE.equals("81")){
			url="htgl/htgl_dcdyinfo.jsp";
		}else if(OPETYPE.equals("99")){
			//url="htgl/htgl_dcdyinfo.jsp";
		}
	}else{
		url="htgl/dcdy_control.jsp";
	}
}else if(CDDL.equals("62")){
	if(STEP.equals("0")){
		if(OPETYPE.equals("20")){
			url="htgl/htgl_gtinfo.jsp";
		}else if(OPETYPE.equals("30")){
			url="htgl/htgl_dcdyinfo_gt.jsp";
		}else if(OPETYPE.equals("50")){
			url="htgl/htgl_dcdyinfo_gt.jsp";
		}else if(OPETYPE.equals("81")){
			url="htgl/htgl_dcdyinfo_gt.jsp";
		}else if(OPETYPE.equals("99")){
			//url="htgl/htgl_dcdyinfo_gt.jsp";
		}
	}else{
		url="htgl/dcdy_control_gt.jsp";
	}
}else if(CDDL.equals("63")){
	if(STEP.equals("0")){
		if(OPETYPE.equals("20")){
			url="htgl/htgl_nminfo.jsp";
		}else if(OPETYPE.equals("30")){
			url="htgl/htgl_dcdyinfo_nm.jsp";
		}else if(OPETYPE.equals("50")){
			url="htgl/htgl_dcdyinfo_nm.jsp";
		}else if(OPETYPE.equals("81")){
			url="htgl/htgl_dcdyinfo_nm.jsp";
		}else if(OPETYPE.equals("99")){
			//url="htgl/htgl_dcdyinfo_nm.jsp";
		}
	}else{
		url="htgl/dcdy_control_nm.jsp";
	}
}else if(CDDL.equals("11")){
	if(STEP.equals("0"))
	{
		if(OPETYPE.equals("20"))
		{
			url="business/business_bainfo.jsp";
		}
		else
		{
			url="business/business_bainfo.jsp";
		}
	}
	else
	{
		url="business/business_control.jsp";
	}
}else if(CDDL.equals("9")){ //广告发布登记
	if ("20".equals(OPETYPE)) { // 设立
		 url="ggdj/ggdj_tbxx.jsp";
	} else if ("30".equals(OPETYPE)) { // 变更
		 url="ggdj/ggdj_select.jsp";	
	} else if ("50".equals(OPETYPE)) { // 注销
		 url="ggdj/ggdj_select.jsp";
	} else { // 其他
		
	}
	
	
}else{
	url="content.jsp";
}
Page.init();
Page.setOPENO(OPENO);
Page.setENTTYPE(ENTTYPE);
Page.setOPETYPE(OPETYPE);
Page.setSIGN(SIGN);
Page.setDL(CDDL);
System.out.println("==="+SIGN);
QYDJ_YWSB_SQ ywsb=new QYDJ_YWSB_SQ();
System.out.println(".getENTCLASS()==="+Page.getENTCLASS());

ywsb.setOPENO(OPENO);
ywsb.doSelect();
Page.setPRIPID(ywsb.getPRIPID());
Page.setENTCLASS(ywsb.getENTCLASS());

if(!OPETYPE.equals("20")){		
	Page.setREGNO(ywsb.getREGNO());		
	//名称变更时，单独从ywsb表里获取注册号和法定代表人身份证号
	if(OPETYPE.equals("13")){
		Page.setXGBH(ywsb.getCERNO());
		Page.setREGNO(ywsb.getREGNO());
	}
}
int num=ywsb.getListCount(" WHERE LOGINID='"+webuser.getLOGINID()+"'");
Page.setNUM(num);
out.println("<script language='javascript'>window.location.href='"+url+"'</script>");
%>