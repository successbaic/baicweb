<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%      
    String OPENO = Page.getOPENO();    
    String OPETYPE=Page.getOPETYPE();
	if(Page.getSTEP()>=3){
	
	}else{
		Page.setSTEP(3);
	}
	String sVaild="1",sMust="0";//\У��λ\����ҳ��	sMust="1"ʱ�ȱ����ٷ�ҳ��sMust="0" ����ֱ�ӷ�ҳ
	if (OPENO.equals(""))
	{		
		sVaild="0";
		sMust="1";
	}
	
	Page.clearPage();
	Page.clearPageCmd();
	
	if(OPETYPE.equals("11")){
		String[] file;
		file= new String[]{"mcgl_tzxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ\����ҳ��
		Page.addPage(file);				
        file= new String[]{"mcgl_fjxx_list.jsp","������Ϣ",sVaild};
		Page.addPage(file);
		file= new String[]{"mcgl_sqwt.jsp","��Ȩί��",sVaild};
		Page.addPage(file);
	}else if(OPETYPE.equals("12")){
		String[] file;	 
		file= new String[]{"mcgl_yqxx.jsp","������Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ\����ҳ��
		Page.addPage(file);				
        file= new String[]{"mcgl_fjxx_list.jsp","������Ϣ",sVaild};
		Page.addPage(file);
		file= new String[]{"mcgl_sqwt.jsp","��Ȩί��",sVaild};
		Page.addPage(file);
	}else if(OPETYPE.equals("13")){
		String[] file;
		file= new String[]{"mcgl_bgxx.jsp","�����Ϣ",sVaild,sMust}; //ҳ���ַ\����\У��λ\����ҳ��
		Page.addPage(file);				
        file= new String[]{"mcgl_fjxx_list.jsp","������Ϣ",sVaild};
		Page.addPage(file);
		file= new String[]{"mcgl_sqwt.jsp","��Ȩί��",sVaild};
		Page.addPage(file);
	}
	String[] file=Page.getFirstPage();
	if (file!=null)
	{ 
		response.sendRedirect( file[0] );	//��תҳ��
	}

%>
