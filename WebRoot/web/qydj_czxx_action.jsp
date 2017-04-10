<%@ page contentType="text/html;charset=GBK"%> 
<%@ include file="../jspheader.inc"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.macrosoft.icms.gsnw.GSYJXX" %> 
<%@ page import="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ" %> 
<%@ page import="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ" %> 
<%@ page import="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ" %> 
<%@ page import="com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS" %> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id='WSDJ_TXJL' scope='page' class='com.macrosoft.icms.util.WSDJ_TXJL'/>
<jsp:useBean id="QYDJ_CZXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ">
	<jsp:setProperty name="QYDJ_CZXX" property="*"/>
</jsp:useBean>

<body>
<%	
	String action = QYDJ_CZXX.doPreProcess(request.getParameter("action"));
	String RECID = QYDJ_CZXX.doPreProcess(request.getParameter("RECID"));
	String OPENO = QYDJ_CZXX.doPreProcess(request.getParameter("OPENO"));
	String PRIPID = Page.getPRIPID();
	//int max =QYDJ_CZXX.getListMax(" where OPENO='"+OPENO+"'");
  //  String date = new SimpleDateFormat("yyyy-MM-dd").format(new java.sql.Date(new java.util.Date().getTime()));  //获取当前系统日期 
	String ENTTYPE=Page.getENTTYPE();
	String opetype=Page.getOPETYPE();
   String CERNO = QYDJ_CZXX.doPreProcess(request.getParameter("CERNO"));
   String CERTYPE = QYDJ_CZXX.doPreProcess(request.getParameter("CERTYPE"));
   boolean ifOnePerson = false;
   if(!action.equals("3")){
	   GSYJXX yjxx=new GSYJXX();
	   QYDJ_JBXX_SQ qydj = new QYDJ_JBXX_SQ();
	   qydj.setOPENO(OPENO);
	   qydj.doSelect();
	   //变更企业类型后一人有限公司是否检查判断
	   if("30".equals(opetype)){
		   QYDJ_BGSX_SQ bgsx = new QYDJ_BGSX_SQ();
		   bgsx.setALTITEM("04");
		   bgsx.setOPENO(OPENO);
		   ArrayList al = bgsx.getData();
		   if(al.size()>0){
			  	String[] ay=(String[])al.get(5);
			   if("1151".equals(ay[1])){
				   ifOnePerson = true;
			   }
		   }
	   }else{
		   if(qydj.getENTTYPE().equals("1151")){
			   ifOnePerson = true;
		   }
	   }
//		System.out.println(ifOnePerson);
	   if(ifOnePerson){
	//		if(mcgl.getENTTYPE().equals("1150") 
	//				|| mcgl.getENTTYPE().equals("1151")
	//				|| mcgl.getENTTYPE().equals("1152")){}
			if(action.equals("2")||action.equals("1")){
				QYDJ_CZXX_SQ bean = null;
			
				bean = new QYDJ_CZXX_SQ();
				bean.setOPENO(OPENO);
				bean.setRECID(RECID);
				bean.doSelect();
			
				if(!bean.getCERNO().equals(QYDJ_CZXX.getCERNO())){
					if(yjxx.checkYrByRy(QYDJ_CZXX.getCERNO())){
						out.print(SysUtility.setAlertScript("姓名："+QYDJ_CZXX.getINV()+" 证件号码："+QYDJ_CZXX.getCERNO()+" 在一人有限公司库中，请核实后再申请!","window.history.back(0);"));
						return;
					}
				}
			}
		}else{
			if(QYDJ_CZXX.getINVTYPE().startsWith("1")){
			//查询本地注销.吊销
				QYDJ_JBXX_ZS qydj_jbxx = new QYDJ_JBXX_ZS();
				List list = qydj_jbxx.getList(" WHERE regno = '"+QYDJ_CZXX.getBLICNO()+"' AND entstatus IN ('2','3')");
				if(list.size()>0){
					QYDJ_JBXX_ZS bean = (QYDJ_JBXX_ZS)list.get(0);
					String infoStr = "";
					if(bean.getENTSTATUS() == 2){
						if(bean.getREVDATE().equals("")){
							infoStr = " 已吊销,不再具备担任法人股东资格";
						}else{
							infoStr = " 已于"+bean.getREVDATE()+"吊销,不再具备担任法人股东资格";
						}
						out.print(SysUtility.setAlertScript("当前企业:"+bean.getENTNAME()+",注册号:"+bean.getREGNO()+infoStr,"window.history.back(0);"));
					}else if(bean.getENTSTATUS() == 3){
						if(bean.getCANDATE().equals("")){
							infoStr = " 已注销,不再具备担任法人股东资格";
						}else{
							infoStr = " 已于"+bean.getCANDATE()+"注销,不再具备担任法人股东资格";
						}
						out.print(SysUtility.setAlertScript("当前企业:"+bean.getENTNAME()+",注册号:"+bean.getREGNO()+infoStr,"window.history.back(0);"));
					}
					
					
					return;
				}
				if(yjxx.checkQyHmd(QYDJ_CZXX.getBLICNO())){
					out.print(SysUtility.setAlertScript("当前企业:"+QYDJ_CZXX.getINV()+",注册号:"+QYDJ_CZXX.getBLICNO()+" 在工商总局黑名单库中,不再具备担任法人股东资格!","parent.window.location.reload();"));
					return;
				}
			}
			//List list_tzrs = QYDJ_CZXX.getList(" WHERE openo = '"+OPENO+"'");
			//for(int i = 0 ; i < list_tzrs.size(); i++){
			//	QYDJ_CZXX_SQ bean = (QYDJ_CZXX_SQ)list_tzrs.get(i);
			//	if(!QYDJ_CZXX.getCERTYPE().equals("")){
			//		if(QYDJ_CZXX.getCERTYPE().equals(bean.getCERTYPE())
			//				&&QYDJ_CZXX.getCERNO().equals(bean.getCERNO())){
			//			if(!QYDJ_CZXX.getRECID().equals(bean.getRECID())){
			//				out.print(SysUtility.setAlertScript("该投资人已投资，一个投资人只能存在一条记录!","window.history.back(0);"));
			//				return;	
			//			}
			//		}
			//		
			//	}else{
			//		if(QYDJ_CZXX.getBLICTYPE().equals(bean.getBLICTYPE())
			//				&&QYDJ_CZXX.getBLICNO().equals(bean.getBLICNO())){
			//			if(!QYDJ_CZXX.getRECID().equals(bean.getRECID())){
			//				out.print(SysUtility.setAlertScript("该投资人已投资，一个投资人只能存在一条记录!","window.history.back(0);"));
			//				return;	
			//			}
			//		}
			//	}
			//}
			
		}
	   if(!QYDJ_CZXX.getCERTYPE().equals("")){
		   if(yjxx.checkGqdj(PRIPID,QYDJ_CZXX.getCERNO())){
				out.print(SysUtility.setAlertScript("提示:该投资人存在股权冻结记录!",""));	
			}
		   if(yjxx.checkGqcz(PRIPID,QYDJ_CZXX.getCERNO())){
				out.print(SysUtility.setAlertScript("提示:该投资人存在股权出质记录!",""));	
			}
	   }else{
		  	if(yjxx.checkGqdj(PRIPID,QYDJ_CZXX.getBLICNO())){
				out.print(SysUtility.setAlertScript("提示:该投资人存在股权冻结记录!",""));	
			}
			if(yjxx.checkGqcz(PRIPID,QYDJ_CZXX.getBLICNO())){
					out.print(SysUtility.setAlertScript("提示:该投资人存在股权出质记录!",""));	
			}
		}
	}
	
		if(action.equals("1"))//添加
		{  
		//  if(max==0){//该业务出资信息表中还没记录时，往WSDJ_TXJL（填写记录表）中插入一条记录；
		//     WSDJ_TXJL.setOPENO(OPENO);
		//     WSDJ_TXJL.setWJBH(1004);
		//     WSDJ_TXJL.setCZRY(webuser.getLOGINID());
		//     WSDJ_TXJL.setJQIP(request.getRemoteHost());
		//     WSDJ_TXJL.setCZSJ(date);
		//     WSDJ_TXJL.doAdd();
		//   }
		 
		    QYDJ_CZXX.setOPENO(OPENO);
			QYDJ_CZXX.setRECID(SysUtility.getUUID20());
			if (QYDJ_CZXX.doAdd())
			out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.reload();"));
		    
			else
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
		}
		else if(action.equals("2"))//修改
		{				
			if (QYDJ_CZXX.doModify())
			out.print(SysUtility.setAlertScript("数据修改成功!","parent.window.location.reload();"));
	   		else
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
		}
		else if(action.equals("3"))//删除
		{

			if (QYDJ_CZXX.doDelete()){		
			out.print(SysUtility.setAlertScript("数据删除成功!","parent.window.location.reload();"));
	   		}else{
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
		    }
		}
	
		
%>