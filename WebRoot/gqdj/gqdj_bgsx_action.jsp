<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="GQDJ_BGSX" scope="page" class="com.macrosoft.icms.gqdj.GQDJ_BGSX_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<%@ page import="com.macrosoft.icms.system.PageShow" %> 
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<body>
<%	String OPENO=Page.getOPENO();
	String vID=Page.getXGBH(); //
	String PRIPID=Page.getPRIPID(); //
	String vSN=Page.getpageKey();
	String LOGINID=GQDJ_BGSX.doPreProcess(request.getParameter("LOGINID"));
	String[] sALTITEM=request.getParameterValues("ALTITEM");
	String sTYPE=request.getParameter("TYPE");

	String ip="";
	if(request.getHeader("x-forwarded-for")==null){
		  ip=request.getRemoteAddr();
	}else{
		  ip=request.getHeader("x-forwarded-for");
	}
	String sqlJbxx="";
	String sqlYwsb="";
	boolean bl=false;	
	boolean IfFirst=false;
	if(OPENO.equals("")|| OPENO==null){//��һ�α��棬�����µ�ҵ����MB��ͷ
		OPENO=SYS_BHBM.getUniqueId(request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//��������ҵ����		
		IfFirst=true;
	}
	///del all
	GQDJ_BGSX.setOPENO(OPENO);
	GQDJ_BGSX.doDeleteAll();	//del all bgxx
	for (int i=0;i<sALTITEM.length;i++)  
	{	
		String ALTITEM=sALTITEM[i];
		String befor="ALTBE"+ALTITEM;
		String after="ALTAF"+ALTITEM;
		String ALTAFTER=GQDJ_BGSX.convertCode(request.getParameter(after));
		String jbmod="";
		String ywsbmod="";
		//�����������ݱ���
		GQDJ_BGSX.setOPENO(OPENO);
		GQDJ_BGSX.setPRIPID(PRIPID);
		GQDJ_BGSX.setALTAF(request.getParameter(after));
		GQDJ_BGSX.setALTBE(request.getParameter(befor));
		GQDJ_BGSX.setALTITEM(ALTITEM);
		GQDJ_BGSX.setALTDATE(webuser.getCurrentDate());
		bl=GQDJ_BGSX.doAdd();
		if(!bl){
			out.print(SysUtility.setAlertScript("�����Ϣ���ʧ��!","parent.window.location.reload();"));
		}		
		if(ALTITEM.equals("01")){//��Ȩ���ڹ�˾����
			jbmod="ENTNAME='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("02")){//��Ȩ���ڹ�˾ע���
			jbmod="REGNO='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("03")){//����������
		    jbmod="EXPMOR='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("05")){//������֤�պ���
		    jbmod="EXPMORBLICNO='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("04")){//��Ȩ������
		    jbmod="IMPMOR='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("06")){//��Ȩ��֤�պ���
		    jbmod="IMPMORBLICNO='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("07")){//���ʹ�Ȩ����
		    jbmod="EXPSHARAM='"+ALTAFTER+"'";
		}
		if(!jbmod.equals("")){
			if(sqlJbxx.equals("")){
				sqlJbxx=jbmod;
			}else{
				sqlJbxx+=","+jbmod;
			}
		}
		if(!ywsbmod.equals(""))
		{
			if(sqlYwsb.equals("")){
				sqlYwsb=ywsbmod;
			}else{
				sqlYwsb+=","+ywsbmod;
			}
		}
	}	
	//������������ҵ�������Ϣ--��һ��ȫ�����룬�Ժ���ݱ�������		
	if(IfFirst)
	{
		bl=GQDJ_BGSX.doZs2Lc(OPENO,vID,vSN);	
		if(!bl){
			out.print(SysUtility.setAlertScript("��ʽ���������ʧ��!","parent.window.location.reload();"));
			return;
		}
	}
	//������ҵ������Ϣ	
	String jbxxSql="UPDATE GQDJ_JBXX_SQ SET APPRDATE=sysdate,OPETYPE='30',STATUS='0',LOGINID='"+LOGINID+"'";
	if(sqlJbxx.equals("")){
		jbxxSql+=" WHERE OPENO="+GQDJ_BGSX.doPreProcess3(OPENO);
	}else{
		jbxxSql+=","+sqlJbxx+" WHERE OPENO="+GQDJ_BGSX.doPreProcess3(OPENO);
	}
	bl=GQDJ_BGSX.doModifyBySql(jbxxSql);
	if(!bl){
		out.print(SysUtility.setAlertScript("������Ϣ���ݸ���ʧ��!","parent.window.location.reload();"));
		return;
	}
	//����ҵ�������в���һ����¼
	String	strsql="";
	QYDJ_YWSB.setOPENO(OPENO);
	if(QYDJ_YWSB.doCount())
	{
		if(QYDJ_YWSB.doPreProcess(request.getParameter("STATUS")).equals("3")){
			 String sqlstr="insert into qydj_ywsb_sq_ls select t.*,sysdate as  rbsj from qydj_ywsb_sq t where openo='"+OPENO+"'";
		    if(!QYDJ_YWSB.doSql(sqlstr)){
		       out.print(SysUtility.setAlertScript("��ʷ���������ʧ��!","parent.window.location.reload();"));
		       return;
		    }
		}
		strsql="UPDATE QYDJ_YWSB_SQ SET "+sqlYwsb+" WHERE OPENO='"+OPENO+"'";
	}
	else
	{
		strsql="INSERT INTO QYDJ_YWSB_SQ (OPENO,PRIPID,OPETYPE,APPDATE,REGNO,ENTNAME,REGORG,LOGINID,ENTCLASS,STATUS,JQIP,CDDL) "
				+"SELECT OPENO,PRIPID,OPETYPE,APPRDATE,REGNO,ENTNAME,REGORG,LOGINID,'4','0','"
				+ip+"','4' FROM GQDJ_JBXX_SQ WHERE OPENO='"+OPENO+"'";
	}
	if(QYDJ_YWSB.doSql(strsql)){
		out.print(SysUtility.setAlertScript("���ݱ���ɹ�!","parent.window.location.href='"+Page.getNextPage()[0]+"'"));
		Page.setMusted(0);	//��ҳ�ѱ��棬���Խ�����һҳ

	}
	else{
		out.print(SysUtility.setAlertScript("���ݱ���ʧ��!","parent.window.location.reload();"));
	}
%>