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
	String sVaild="1",sMust="0";//\校验位\必填页面	sMust="1"时先保存再翻页，sMust="0" 可以直接翻页
	if (OPENO.equals(""))
	{		
		sVaild="0";
		sMust="1";
	}
	
	Page.clearPage();
	Page.clearPageCmd();
	
	if(OPETYPE.equals("11")){
		String[] file;
		file= new String[]{"mcgl_tzxx.jsp","调整信息",sVaild,sMust}; //页面地址\名称\校验位\必填页面
		Page.addPage(file);				
        file= new String[]{"mcgl_fjxx_list.jsp","附件信息",sVaild};
		Page.addPage(file);
		file= new String[]{"mcgl_sqwt.jsp","授权委托",sVaild};
		Page.addPage(file);
	}else if(OPETYPE.equals("12")){
		String[] file;	 
		file= new String[]{"mcgl_yqxx.jsp","延期信息",sVaild,sMust}; //页面地址\名称\校验位\必填页面
		Page.addPage(file);				
        file= new String[]{"mcgl_fjxx_list.jsp","附件信息",sVaild};
		Page.addPage(file);
		file= new String[]{"mcgl_sqwt.jsp","授权委托",sVaild};
		Page.addPage(file);
	}else if(OPETYPE.equals("13")){
		String[] file;
		file= new String[]{"mcgl_bgxx.jsp","变更信息",sVaild,sMust}; //页面地址\名称\校验位\必填页面
		Page.addPage(file);				
        file= new String[]{"mcgl_fjxx_list.jsp","附件信息",sVaild};
		Page.addPage(file);
		file= new String[]{"mcgl_sqwt.jsp","授权委托",sVaild};
		Page.addPage(file);
	}
	String[] file=Page.getFirstPage();
	if (file!=null)
	{ 
		response.sendRedirect( file[0] );	//跳转页面
	}

%>
