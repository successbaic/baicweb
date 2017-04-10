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
    	
    
    String sVaild="0",sMust="1";//\校验位\必填页面	sMust="1"时先保存再翻页，sMust="0" 可以直接翻页
	if (!ENTTYPE.equals(""))
	{		
		sVaild="1";
		sMust="0";
	}

    String[] file;
    PageShow pageShow=new PageShow();	
	pageShow.getPageForMC(ENTCLASS,ENTTYPE,sMust,sVaild,Page);
	
	 String rp="",bt="返回前页";
	 if(OPENO.equals("")){
	 	bt="返回前页";
	    rp="../content.jsp";
	 }else{//修改	   
	    rp="../content.jsp";
	 }
	
	file= new String[]{"JavaScript:location.href='"+rp+"'",bt,"1"};
	Page.addCmd(file);
	
	file=Page.getFirstPage();
	
	if (file!=null)
	{ 
		response.sendRedirect( file[0] );	//跳转页面
	}

%>
