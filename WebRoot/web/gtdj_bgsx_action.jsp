<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="GTDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_BGXX_SQ"/>
<jsp:useBean id='WSDJ_TXJL' scope='page' class='com.macrosoft.icms.util.WSDJ_TXJL'/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<html><head><title>���ݱ���</title></head>
<body>
<%
    String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	String OPENO=Page.getOPENO();
	String REGNO=Page.getREGNO();
	String PRIPID=Page.getPRIPID();
	String[] sALTITEM=request.getParameterValues("ALTITEM");
	String sTYPE=request.getParameter("TYPE");
	String ip="";
    if(request.getHeader("x-forwarded-for")==null){
  	  ip=request.getRemoteAddr();
    }else{
  	  ip=request.getHeader("x-forwarded-for");
    }
  
    String XZQH=webuser.getXZQH();
    //��������������������º�˫��ҵ��ϵͳ���ӵ�ַ�жϣ��ж��Ƿ���Υ�½�����ַ������ǲ����������Ǽ�
    	if(XZQH.startsWith("3701")){
    		//���ж�ԭ�Ǽ�ס���Ƿ���ֵ���Ƿ�����Υ������
    		String dom="";
    		if(request.getParameter("ALTBE02")!=null && request.getParameter("ALTBE02")!=""){
  			dom=new String((request.getParameter("ALTBE02")).getBytes("ISO-8859-1"),"GBK");
  		}
    		if(request.getParameter("ALTBE16")!=null && request.getParameter("ALTBE16")!=""){
  			dom=new String((request.getParameter("ALTBE16")).getBytes("ISO-8859-1"),"GBK");
  		}
    		String sql = "SELECT * FROM SZSH_XTJG_WZJZ WHERE ACTUALDOM='"+dom+"'";
  			ResultSet rs = gsdbc.executeQuery(sql);
  			if(rs.next()){
  				out.print(SysUtility.setAlertScript("�õǼǵ�ַ�ѱ���ΪΥ��Υ�½���������������̵Ǽ�ҵ��!",parentOption));
  				return;
  			
  		}
  		//ѭ��ѡ�еı��������ס����ȡ��������ס�����ж��Ƿ���Υ��Υ�½���	
    		for(int i=0;i<sALTITEM.length;i++){
    			String ALTITEM=sALTITEM[i];
    			if(ALTITEM.equals("02") || ALTITEM.equals("16")){//ס��
    				String after="ALTAF"+ALTITEM;//ȡ�������ס����Ϣ
    				String aftervalue=new String((request.getParameter(after)).getBytes("ISO-8859-1"),"GBK");
    				String sql1 = "SELECT * FROM SZSH_XTJG_WZJZ WHERE ACTUALDOM='"+aftervalue+"'";
    				ResultSet rs1 = gsdbc.executeQuery(sql1);
    				if(rs1.next()){
    					out.print(SysUtility.setAlertScript("�õǼǵ�ַ�ѱ���ΪΥ��Υ�½���������������̵Ǽ�ҵ��!",parentOption));
    					return;
    				
    				}
    				
    			}
    	
    		}
    		
    	}
    
	//String sqlJbxx="";
	String sqlRyxx="";
	boolean bl=false;	
	boolean IfFirst=false;
	boolean RyChange=false;
	if(OPENO.equals("")|| OPENO==null){//��һ�α��棬�����µ�ҵ����MB��ͷ
		OPENO=SYS_BHBM.CREATEBH(2,request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//��������ҵ����		
		IfFirst=true;
	}
	//ɾ��ԭ���ı����Ϣ
	GTDJ_BGSX.setOPENO(OPENO);
	GTDJ_BGSX.doDeleteAll();
	
	//ѭ��������д�ı������
	for(int i=0;i<sALTITEM.length;i++){
		String ALTITEM=sALTITEM[i];
		String befor="ALTBE"+ALTITEM;
		String after="ALTAF"+ALTITEM;
		String ALTAFTER=GTDJ_BGSX.convertCode(request.getParameter(after));
		String jbmod="";
		String rymod="";
		//�����������ݱ���
		GTDJ_BGSX.setOPENO(OPENO);
		GTDJ_BGSX.setALTAF(request.getParameter(after));
		GTDJ_BGSX.setALTBE(request.getParameter(befor));
		GTDJ_BGSX.setALTITEM(ALTITEM);
		GTDJ_BGSX.setALTDATE(webuser.getCurrentDate());
		GTDJ_BGSX.setPRIPID(PRIPID);
		bl=GTDJ_BGSX.doAdd();
		if(!bl){
			out.print(SysUtility.setAlertScript("�����Ϣ���ʧ��!","parent.window.location.reload();"));
		}		
		if(ALTITEM.equals("01")){//�ֺ�����
			jbmod="TRANAME='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("09")){//��Ӫ��
			RyChange=true;
			jbmod="OPERNAME='"+ALTAFTER+"'";
			rymod="NAME='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("68")){//�Ա�
		    RyChange=true;
		    rymod="SEX='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("64")){//����
		    RyChange=true;
		    rymod="NATION='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("70")){//������ò
		    RyChange=true;
		    rymod="POLSTAND='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("71")){//�Ļ��̶�
		    RyChange=true;
		    rymod="LITEDEG='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("72")){//ְҵ״��
		    RyChange=true;
		    rymod="OCCSTBEAPP='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("65")){//��ͥ��Ա		    
		    jbmod="FAMMEMBER='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("66")){//���֤����
		    RyChange=true;
		    rymod="CERNO='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("67")){//ס��
		    RyChange=true;
		    rymod="DOM='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("73")){//��������
		    RyChange=true;
		    rymod="POSTALCODE='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("74")){//��Ӫ����ϵ�绰
		    RyChange=true;
		    rymod="TEL='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("75")){//��������
		    RyChange=true;
		    rymod="EMAIL='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("76")){//��Ӫ���ƶ��绰
			RyChange=true;
			rymod="MOBTEL='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("14")){//�����ʽ
			jbmod="COMPFORM='"+ALTAFTER+"'";			
		}else if(ALTITEM.equals("15")){//��Ӫ��Χ
			jbmod="BUSSCOANDFORM='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("04")){//�ʽ�����
			jbmod="CAPAM='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("50")){//��ϵ�绰
			jbmod="TEL='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("69")){//��������
			jbmod="POSTALCODE='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("16")){//��Ӫ����
			jbmod="OPLOC='"+ALTAFTER+"'";
		
			GTDJ_BGSX.setOPENO(OPENO);
			GTDJ_BGSX.setALTDATE(webuser.getCurrentDate());
			GTDJ_BGSX.setPRIPID(PRIPID);
			
			GTDJ_BGSX.setALTAF(request.getParameter("ALTAF161"));
			GTDJ_BGSX.setALTBE(request.getParameter("ALTBE161"));
			GTDJ_BGSX.setALTITEM("161");
			bl=GTDJ_BGSX.doAdd();
			
			GTDJ_BGSX.setALTAF(request.getParameter("ALTAF162"));
			GTDJ_BGSX.setALTBE(request.getParameter("ALTBE162"));
			GTDJ_BGSX.setALTITEM("162");
			bl=GTDJ_BGSX.doAdd();
			
			GTDJ_BGSX.setALTAF(request.getParameter("ALTAF163"));
			GTDJ_BGSX.setALTBE(request.getParameter("ALTBE163"));
			GTDJ_BGSX.setALTITEM("163");
			bl=GTDJ_BGSX.doAdd();
			
			GTDJ_BGSX.setALTAF(request.getParameter("ALTAF164"));
			GTDJ_BGSX.setALTBE(request.getParameter("ALTBE164"));
			GTDJ_BGSX.setALTITEM("164");
			bl=GTDJ_BGSX.doAdd();
			
			GTDJ_BGSX.setALTAF(request.getParameter("ALTAF165"));
			GTDJ_BGSX.setALTBE(request.getParameter("ALTBE165"));
			GTDJ_BGSX.setALTITEM("165");
			bl=GTDJ_BGSX.doAdd();
			
			GTDJ_BGSX.setALTAF(request.getParameter("ALTAF166"));
			GTDJ_BGSX.setALTBE(request.getParameter("ALTBE166"));
			GTDJ_BGSX.setALTITEM("166");
			bl=GTDJ_BGSX.doAdd();
			
		}else if(ALTITEM.equals("13")){//��ҵ����
			jbmod="EMPNUM='"+ALTAFTER+"'";
		}	
		/*
		if(!jbmod.equals("")){
			if(sqlJbxx.equals("")){
				sqlJbxx=jbmod;
			}else{
				sqlJbxx+=","+jbmod;
			}
		}
		*/
		if(!rymod.equals("")){
		    if(sqlRyxx.equals("")){
		         sqlRyxx=rymod;
		    }else{
		         sqlRyxx+=","+rymod;
		    }
		}
	}
	//������������ҵ�������Ϣ--��һ��ȫ�����룬�Ժ���ݱ�������
	if(IfFirst){		
		bl=GTDJ_BGSX.doZs2Lc(OPENO,PRIPID,"30","true");		
	}else{
		bl=GTDJ_BGSX.doZs2Lc(OPENO,PRIPID,"30",(!RyChange)+"");
	}
	if(!bl){
		out.print(SysUtility.setAlertScript("��ʽ���������ʧ��!","parent.window.location.reload();"));
	}
	//NWACTION nwaction=new NWACTION();
	//nwaction.getSqlList();
	//nwaction.getNwJbxx(OPENO,PRIPID);
	//nwaction.getNwRyxx(OPENO,PRIPID);
	//nwaction.getNwCzxx(OPENO,PRIPID);
	//nwaction.doSqlExcute();
	//������ҵ������Ϣ
	
	String jbxxSql="UPDATE GTDJ_JBXX_SQ SET APPDATE=sysdate,OPETYPE=30,STATUS='0',LOGINID='"+webuser.getLOGINID()
	+"',SPANAME1='"+SysUtility.doPreProcess(request.getParameter("SPANAME1"))+"' WHERE OPENO="+SysUtility.doPreProcess3(OPENO);
	
	bl=GTDJ_BGSX.doModifyBySql(jbxxSql);
	if(!bl){
		out.print(SysUtility.setAlertScript("������Ϣ���ݸ���ʧ��!","parent.window.location.reload();"));
		return;
	}
	//������Ա��Ϣ
	if(!sqlRyxx.equals("")){
	    //System.out.println("UPDATE GTDJ_JYZXX_SQ SET "+sqlRyxx+" WHERE OPENO="+GTDJ_BGSX.doPreProcess3(OPENO)+"");
		bl=GTDJ_BGSX.doModifyBySql("UPDATE GTDJ_JYZXX_SQ SET "+sqlRyxx+" WHERE OPENO="+GTDJ_BGSX.doPreProcess3(OPENO)+"");
		if(!bl){
			out.print(SysUtility.setAlertScript("��Ӫ����Ϣ���ݸ���ʧ��!","parent.window.location.reload();"));
		}
	}
	//����ҵ�������в���һ����¼
	QYDJ_YWSB.setOPENO(OPENO);
	if(QYDJ_YWSB.doCount()){		
		bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ "
		+"SET (ENTNAME,LEREP,REGORG,JQIP,LOCALADM,OPELOCDISTRICT) "
		+"=(SELECT TRANAME,OPERNAME,REGORG,'"
		+ip+"',LOCALADM,OPELOCDISTRICT FROM GTDJ_JBXX_SQ WHERE OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'");		
	}else{
		bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ "
		+"(OPENO,PRIPID,OPETYPE,APPDATE,REGNO,UNISCID,ENTNAME,LEREP,REGORG,LOGINID,ENTCLASS,ENTTYPE,STATUS,JQIP,CDDL,LOCALADM,OPELOCDISTRICT) "
		+"SELECT OPENO,PRIPID,OPETYPE,APPDATE,REGNO,UNISCID,TRANAME,OPERNAME,REGORG,LOGINID,'5','9999','0','"
		+ip+"','"+sTYPE+"',LOCALADM,OPELOCDISTRICT FROM GTDJ_JBXX_SQ WHERE OPENO='"+OPENO+"'");
	}
	

	if(IfFirst){
		//��ҵ�������Ϣ���л�û��¼ʱ����WSDJ_TXJL����д��¼���в���һ����¼��
		WSDJ_TXJL.setOPENO(OPENO);
		WSDJ_TXJL.setWJBH(1001);
		WSDJ_TXJL.setCZRY(webuser.getLOGINID());
		WSDJ_TXJL.setJQIP(ip);
		WSDJ_TXJL.setCZSJ(webuser.getCurrentDate());
		bl=WSDJ_TXJL.doAdd();
	}
	String[] file;
	Page.clearPage();
	file= new String[]{"gtdj_bgsx.jsp","�������","1"};
	Page.addPage(file);
	//if(RyChange){
	//	file= new String[]{"gtdj_jyzxx.jsp","��Ӫ����Ϣ","1"};
	//	Page.addPage(file);
	//}
		
	file= new String[]{"qydj_xkxx_list.jsp","�����Ϣ","1"};
	Page.addPage(file);
	
	file= new String[]{"gtdj_sqwt.jsp","��Ȩί��","1"};
	Page.addPage(file);
	file= new String[]{"wsdj_fjxx_list.jsp","������Ϣ","1"};
	Page.addPage(file);
	if(bl){
		out.print(SysUtility.setAlertScript("����ɹ�!","parent.window.location.href='../"+Page.getNextPage()[0]+"'"));
	}
	else{
		out.print(SysUtility.setAlertScript("����ʧ��!","parent.window.location.reload();"));
	}
%>
</body>
</html>