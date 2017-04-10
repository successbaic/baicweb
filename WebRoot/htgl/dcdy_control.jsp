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
	String sVaild="1",sMust="0";//\校验位\必填页面	sMust="1"时先保存再翻页，sMust="0" 可以直接翻页
	if (OPENO.equals(""))
	{		
		sVaild="0";
		sMust="1";
	}
	
	Page.clearPage();
	Page.clearPageCmd();

	String[] file;
	if(OPETYPE.equals("20")){
		file= new String[]{"dcdy_jbxx.jsp","基本信息", sVaild, sMust}; //页面地址\名称\校验位 
		Page.addPage(file);
		file= new String[]{"dcdy_dywxx_list.jsp","抵押物信息",sVaild};
		Page.addPage(file);		
	}else if(OPETYPE.equals("30")){
		file= new String[]{"dcdy_bgsx.jsp","变更信息", sVaild, sMust}; //页面地址\名称\校验位 
		Page.addPage(file);
	}else if(OPETYPE.equals("50")){
		file= new String[]{"dcdy_zxxx.jsp","注销信息", sVaild, sMust}; //页面地址\名称\校验位 
		Page.addPage(file);
	}else if(OPETYPE.equals("81")){
		file= new String[]{"dcdy_cxxx.jsp","撤销信息", sVaild, sMust}; //页面地址\名称\校验位 
		Page.addPage(file);
	}else if(OPETYPE.equals("99")){
		file= new String[]{"dcdy_zxxx.jsp","异议信息", sVaild, sMust}; //页面地址\名称\校验位 
		Page.addPage(file);
	}
		
	file= new String[]{"htgl_fjxx_list.jsp","提交文件", sVaild};
	Page.addPage(file);	
	
	file=Page.getFirstPage();
	if (file!=null)
	{ 
		response.sendRedirect( file[0] );	//跳转页面
	}

%>
