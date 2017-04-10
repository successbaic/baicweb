<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.PageShow" %> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="GQDJ_JBXX_SQ" scope="page" class="com.macrosoft.icms.gqdj.GQDJ_JBXX_SQ"/>
<%      
    String OPENO = Page.getOPENO();    
    String ENTTYPE=Page.getENTTYPE();
    String OPETYPE=Page.getOPETYPE();
    
    System.out.println("Page.getSTEP:"+Page.getSTEP());
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
	
	//PageShow pageShow=new PageShow();	
 	String[] file;
	if(OPETYPE.equals("20")){
		file= new String[]{"gqdj_jbxx.jsp","基本信息",sVaild,sMust}; //页面地址\名称\校验位\必填页面
		Page.addPage(file);
		file= new String[]{"gqdj_sqwt.jsp","授权委托",sVaild};
		Page.addPage(file);
		file= new String[]{"gqdj_wzllr.jsp","工商联络员",sVaild};
		Page.addPage(file);
	}
	else if(OPETYPE.equals("30"))
	{
		file= new String[]{"gqdj_bgsx.jsp","变更事项",sVaild,sMust}; //页面地址\名称\校验位\必填页面
		Page.addPage(file);
		file= new String[]{"gqdj_sqwt.jsp","授权委托",sVaild};
		Page.addPage(file);
		file= new String[]{"gqdj_wzllr.jsp","工商联络员",sVaild};
		Page.addPage(file);
		//pageShow.getPageForBg(ENTTYPE, RyChange, CzChange,FgsChange,WzllrChange, sVaild, sMust, Page);
	}else if(OPETYPE.equals("40")){
		//pageShow.getPageForBa(ENTTYPE, RyChange, CzChange,FgsChange,WzllrChange, sVaild, sMust, Page);	
	}else if(OPETYPE.equals("50")){
		file= new String[]{"gqdj_zxxx.jsp","注销信息",sVaild,sMust}; //页面地址\名称\校验位\必填页面
		Page.addPage(file);
		file= new String[]{"gqdj_sqwt.jsp","授权委托",sVaild};
		Page.addPage(file);
		file= new String[]{"gqdj_wzllr.jsp","工商联络员",sVaild};
		Page.addPage(file);
	}
	else if(OPETYPE.equals("81")){
		file= new String[]{"gqdj_cxxx.jsp","撤销信息",sVaild,sMust}; //页面地址\名称\校验位\必填页面
		Page.addPage(file);
		file= new String[]{"gqdj_sqwt.jsp","授权委托",sVaild};
		Page.addPage(file);
		file= new String[]{"gqdj_wzllr.jsp","工商联络员",sVaild};
		Page.addPage(file);
	}
	file=Page.getFirstPage();
	if (file!=null)
	{ 
		response.sendRedirect( file[0] );	//跳转页面
	}

%>
