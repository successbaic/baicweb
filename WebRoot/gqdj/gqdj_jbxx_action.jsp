<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<html><head><title>数据保存</title></head>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id='WSDJ_TXJL' scope='page' class='com.macrosoft.icms.util.WSDJ_TXJL'/>
<jsp:useBean id="GQDJ_JBXX" scope="page"  class="com.macrosoft.icms.gqdj.GQDJ_JBXX_SQ">
<jsp:setProperty name="GQDJ_JBXX" property="*"/>
</jsp:useBean>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ">
<jsp:setProperty name="QYDJ_YWSB" property="*"/>
</jsp:useBean>
<body>
<%
	String OPENO=GQDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	String PRIPID=GQDJ_JBXX.doPreProcess(request.getParameter("PRIPID"));
	String LOGINID=GQDJ_JBXX.doPreProcess(request.getParameter("LOGINID"));
	String action=GQDJ_JBXX.doPreProcess(request.getParameter("action"));
	boolean bl=false;
	String ip="";
    if(request.getHeader("x-forwarded-for")==null){
  	  ip=request.getRemoteAddr();
    }else{
  	  ip=request.getHeader("x-forwarded-for");
    }
    
	if(OPENO.equals("")|| OPENO==null)
	{//第一次保存，生成新的业务编号MB开头
	//在外网中不加SN代码。当外网导内网时函数加SN导入
		OPENO=SYS_BHBM.getUniqueId(request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//重新设置业务编号
	}
	GQDJ_JBXX.setOPENO(OPENO);
	GQDJ_JBXX.setSTATUS(0);	
	GQDJ_JBXX.setPRIPID(PRIPID);
	if (action.equals("1")||action.equals("2"))// 新增或修改
	{
     	if (GQDJ_JBXX.doCount()) 
		{
			bl=GQDJ_JBXX.doWWModify();
		 }
		 else
		 {  
			bl=GQDJ_JBXX.doAdd();
		 }	
	}	
	else if(action.equals("3"))//数据删除
	{
		bl=GQDJ_JBXX.doDelete();
		if (bl)
			out.print(SysUtility.setAlertScript("数据删除成功!","parent.window.location.reload();"));
		else
			out.print(SysUtility.setAlertScript("数据删除失败!","parent.window.location.reload();"));
	}
	if(bl)
	{
		String strsql="";
		QYDJ_YWSB.setOPENO(OPENO);
		if(QYDJ_YWSB.doCount())
		{
			if(QYDJ_YWSB.doPreProcess(request.getParameter("STATUS")).equals("3"))
			{
				String sqlstr="insert into qydj_ywsb_sq_ls select t.*,sysdate as  rbsj from qydj_ywsb_sq t where openo='"+OPENO+"'";
			    if(!QYDJ_YWSB.doSql(sqlstr))
			    {
			       out.print(SysUtility.setAlertScript("历史表添加数据失败!","parent.window.location.reload();"));
			       return;
			    }
			}
			strsql="UPDATE QYDJ_YWSB_SQ SET JQIP='"+ip+"',LOGINID='"+LOGINID+"',OPETYPE='"+ GQDJ_JBXX.getOPETYPE() +"',REGNO='"+GQDJ_JBXX.getREGNO()+"',ENTNAME='"+ GQDJ_JBXX.getENTNAME() +"',REGORG='"+ GQDJ_JBXX.getREGORG()+"', APPDATE=to_date('"+GQDJ_JBXX.getAPPRDATE() +"','yyyy-mm-dd')";
			strsql+=" WHERE OPENO='"+OPENO+"'";
		}
		else
		{		
			 strsql="INSERT INTO QYDJ_YWSB_SQ";
			 strsql+="(CDDL,JQIP,STATUS,LOGINID,OPENO,PRIPID,OPETYPE,REGNO,ENTNAME,REGORG,APPDATE,ENTCLASS) VALUES";
			 strsql+="('4','"+ ip +"','0','"+ LOGINID +"','"+ OPENO +"','"+ PRIPID +"','"+ GQDJ_JBXX.getOPETYPE() +"','"+ GQDJ_JBXX.getREGNO()+"','"+ GQDJ_JBXX.getENTNAME() +"','"+ GQDJ_JBXX.getREGORG()+"', to_date('"+GQDJ_JBXX.getAPPRDATE() +"','yyyy-mm-dd'),4)";
		}
		if(QYDJ_YWSB.doSql(strsql))
		{
			out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.href='"+Page.getNextPage()[0]+"'"));
			Page.setMusted(0);	//该页已保存，可以进入下一页
		}
	}
	else
	{
		out.print(SysUtility.setAlertScript("业务申报数据保存失败!","parent.window.location.reload();"));
	}
%>
</body>
</html>