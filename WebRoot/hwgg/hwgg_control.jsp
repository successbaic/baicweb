<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%      
    String OPENO = Page.getOPENO();    
    String ENTTYPE=Page.getENTTYPE();
    String OPETYPE=Page.getOPETYPE();
    
    int num=2;
	if(Page.getOPETYPE().equals("20")){
	num=1;
	}
	if(Page.getSTEP()>=num){
	
	}else{
		Page.setSTEP(num);
	}
	String sVaild="1",sMust="0";//\У��λ\����ҳ��	sMust="1"ʱ�ȱ����ٷ�ҳ��sMust="0" ����ֱ�ӷ�ҳ
	if (OPENO.equals(""))
	{		
		sVaild="0";
		sMust="1";
	}
	
	Page.clearPage();
	Page.clearPageCmd();

	String[] file;
	if(OPETYPE.equals("20")){
		file= new String[]{"hwgg_jbxx.jsp","������Ϣ", sVaild, sMust}; //ҳ���ַ\����\У��λ 
		Page.addPage(file);
		file= new String[]{"hwgg_ggfbz.jsp","��淢����",sVaild};
		Page.addPage(file);
		file= new String[]{"hwgg_ggzxx.jsp","�����",sVaild};
		Page.addPage(file);
		
	}else if(OPETYPE.equals("30")){
		file= new String[]{"hwgg_bgsx.jsp","�����Ϣ", sVaild, sMust}; //ҳ���ַ\����\У��λ 
		Page.addPage(file);
	}
		
	file= new String[]{"hwgg_fjxx_list.jsp","�ύ�ļ�", sVaild};
	Page.addPage(file);	
	
	file=Page.getFirstPage();
	if (file!=null)
	{ 
		response.sendRedirect( file[0] );	//��תҳ��
	}

%>
