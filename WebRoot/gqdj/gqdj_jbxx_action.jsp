<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<html><head><title>���ݱ���</title></head>
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
	{//��һ�α��棬�����µ�ҵ����MB��ͷ
	//�������в���SN���롣������������ʱ������SN����
		OPENO=SYS_BHBM.getUniqueId(request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//��������ҵ����
	}
	GQDJ_JBXX.setOPENO(OPENO);
	GQDJ_JBXX.setSTATUS(0);	
	GQDJ_JBXX.setPRIPID(PRIPID);
	if (action.equals("1")||action.equals("2"))// �������޸�
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
	else if(action.equals("3"))//����ɾ��
	{
		bl=GQDJ_JBXX.doDelete();
		if (bl)
			out.print(SysUtility.setAlertScript("����ɾ���ɹ�!","parent.window.location.reload();"));
		else
			out.print(SysUtility.setAlertScript("����ɾ��ʧ��!","parent.window.location.reload();"));
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
			       out.print(SysUtility.setAlertScript("��ʷ���������ʧ��!","parent.window.location.reload();"));
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
			out.print(SysUtility.setAlertScript("���ݱ���ɹ�!","parent.window.location.href='"+Page.getNextPage()[0]+"'"));
			Page.setMusted(0);	//��ҳ�ѱ��棬���Խ�����һҳ
		}
	}
	else
	{
		out.print(SysUtility.setAlertScript("ҵ���걨���ݱ���ʧ��!","parent.window.location.reload();"));
	}
%>
</body>
</html>