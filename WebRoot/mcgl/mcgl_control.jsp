<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/jspheader.inc"%>
<%@ page import="com.macrosoft.icms.system.PageShow" %> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%      

	String OPENO = Page.getOPENO();
	String ENTCLASS=Page.getENTCLASS();
	String ENTTYPE=Page.getENTTYPE();
    String SIGN = Page.getSIGN();
   // Page.init();
   
   Page.clearPage();
    Page.clearPageCmd();
    	
    
    String sVaild="0",sMust="1";//\У��λ\����ҳ��	sMust="1"ʱ�ȱ����ٷ�ҳ��sMust="0" ����ֱ�ӷ�ҳ
	if (!ENTTYPE.equals(""))
	{		
		sVaild="1";
		sMust="0";
	}

    String[] file;
    PageShow pageShow=new PageShow();	
	pageShow.getPageForMC(ENTCLASS,ENTTYPE,sMust,sVaild,Page);
	
	 String rp="",bt="����ǰҳ";
	 if(OPENO.equals("")){
	 	bt="����ǰҳ";
	    rp="../content.jsp";
	 }else{//�޸�	   
	    rp="../content.jsp";
	 }
	
	file= new String[]{"JavaScript:location.href='"+rp+"'",bt,"1"};
	Page.addCmd(file);
	
	file=Page.getFirstPage();
	
	if (file!=null)
	{ 
		response.sendRedirect( file[0] );	//��תҳ��
	}

%>
