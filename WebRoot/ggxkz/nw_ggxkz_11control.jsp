<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<jsp:useBean id='SysUrlForm' scope='session' class='com.macrosoft.icms.system.SysUrlForm'/>
<%  
	String ADBULICNO=request.getParameter("ADBULICNO");
	String sINSYEAR=request.getParameter("INSYEAR");
	String SIGN=request.getParameter("SIGN");
	String ADBUENT=request.getParameter("ADBUENT");
	String blFlag=request.getParameter("blFlag");
	int INSYEAR=Integer.parseInt(sINSYEAR);
	GGGL_JYDW_JBXX.setADBULICNO(ADBULICNO);
	GGGL_JYDW_JBXX.setINSYEAR(INSYEAR);
	GGGL_JYDW_JBXX.doSelect();	
	
    Page.init();
    Page.setpageKey(ADBULICNO); //广告经营许可证号
    Page.setipageKey(INSYEAR);//检查年度
    Page.setpageKey1(SIGN);
    Page.setpageKey3("");
    Page.setpageKey2(blFlag);//补录标志，如果是从内网补录业务过来的，值为1
    Page.setopra("");
	String[] file;
	String sVaild="1",sMust="0";//\校验位\必填页面	sMust="1"时先保存再翻页，sMust="0" 可以直接翻页

	
	file= new String[]{"ggxkz_blxx.jsp","广告统计信息",sVaild};
	Page.addPage(file);	
	
	String rp="ggxkz_11bl_list.jsp",bt="返回信息列表";		
	
	file= new String[]{"JavaScript:location.href='"+rp+"'",bt,"1"};
	Page.addCmd(file);
	file=Page.getFirstPage();
	if (file!=null)
	{ 
		response.sendRedirect( file[0] );	//跳转页面
	}

%>