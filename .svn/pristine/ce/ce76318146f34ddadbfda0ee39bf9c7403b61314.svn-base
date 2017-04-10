<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.*"%>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"%>
<%@page import="com.macrosoft.icms.bean.ONLINE_ORDER_RECODER"%>

<%
	String YYRQ = SysUtility.doPreProcess(request.getParameter("YYRQ"));
	String OPENO = SysUtility.doPreProcess(request
			.getParameter("OPENO"));
	String REGORG = SysUtility.doPreProcess(request
			.getParameter("REGORG"));
	String YYTYPE = SysUtility.doPreProcess(request
			.getParameter("YYTYPE"));//1:登记预约 2：名称预约
	String YYSTATUS = SysUtility.doPreProcess(request
			.getParameter("YYSTATUS"));
	
	String ORDERDATE = YYRQ.substring(0, 10);
	String STARTTIME = YYRQ.substring(11, 16);
			
	String ORDERNO = SYS_BHBM.CREATEBH(3, REGORG);
	String XZQH=webuser.getXZQH();
	//if(XZQH!=null && XZQH.equals("3701")){
		if(ORDERNO.length()>6){
			ORDERNO=ORDERNO.substring(6);
			int BH=Integer.parseInt(ORDERNO);
			//System.out.println("ORDERNO:"+ORDERNO);
			//System.out.println("BH:"+BH);
			String IFSXW="1";
			if(STARTTIME.indexOf("8:30")>0 || STARTTIME.indexOf("9:00")>0){
				IFSXW="1";
			}else{
				IFSXW="2";
			}
			com.macrosoft.icms.util.WSDJ_WSYY WSDJ_WSYY=new com.macrosoft.icms.util.WSDJ_WSYY();
			ORDERNO=WSDJ_WSYY.doYYNO(BH+"",IFSXW);
			//System.out.println("2-ORDERNO:"+ORDERNO);
		}		
	//}
	
	
	String ENDTIME = YYRQ.substring(17);
	QYDJ_YWSB_SQ ywsb = new QYDJ_YWSB_SQ();
	ywsb.setOPENO(OPENO);
	ywsb.doSelect();
	ywsb.setSTATUS("8");
	ONLINE_ORDER_RECODER recoder = new ONLINE_ORDER_RECODER();
	recoder.setOPENO(OPENO);
	recoder.doSelect();
	recoder.setORDERDATE(ORDERDATE);
	recoder.setSTARTTIME(STARTTIME);
	recoder.setENDTIME(ENDTIME);
	recoder.setRECORDERDATE(DateUtils
			.getTodayStr("yyyy-MM-dd hh:mm:ss"));
	recoder.doModify();
	recoder.setORDERNO(ORDERNO);
	recoder.setREGORG(REGORG);
	recoder.setENTNAME(ywsb.getENTNAME());
	recoder.setOPERTYPE(ywsb.getOPETYPE());
	recoder.setORDERDATE(ORDERDATE);
	recoder.setSTARTTIME(STARTTIME);
	recoder.setENDTIME(ENDTIME);
	recoder.setRECODERTYPE("8");
	recoder.setLOGINID(webuser.getLOGINID());
	recoder.setRECORDERDATE(DateUtils
			.getTodayStr("yyyy-MM-dd hh:mm:ss"));
	if ("1".equals(YYSTATUS)) {//重新预约时修改预约记录
		if (recoder.doModify()) {
			out.print(SysUtility.setAlertScript("预约成功，预约号码是：" + ORDERNO
					+ "。您预约的时间是：" + YYRQ + "请在预约时间内，携带相关材料来工商局办理业务！",
					"window.returnValue=true;window.close();"));
		} else {
			out.print(SysUtility.setAlertScript("系统异常！",
					"parent.window.location.reload();"));

		}
	} else {//第一次预约或者逾期预约增加记录
		if (recoder.doAdd()) {
			out.print(SysUtility.setAlertScript("预约成功，预约号码是：" + ORDERNO
					+ "。您预约的时间是：" + YYRQ + "请在预约时间内，携带相关材料来工商局办理业务！",
					"window.returnValue=true;window.close();"));
		} else {
			out.print(SysUtility.setAlertScript("系统异常！",
					"parent.window.location.reload();"));

		}
	}
%>