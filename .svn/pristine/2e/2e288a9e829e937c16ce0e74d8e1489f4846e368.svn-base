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
	int INSYEAR=Integer.parseInt(sINSYEAR);
	GGGL_JYDW_JBXX.setADBULICNO(ADBULICNO);
	GGGL_JYDW_JBXX.setINSYEAR(INSYEAR);
	GGGL_JYDW_JBXX.doSelect();	
	
    Page.init();
    Page.setpageKey(ADBULICNO); //广告经营许可证号
    Page.setipageKey(INSYEAR);//检查年度
    Page.setpageKey1(SIGN);
    Page.setpageKey3("");
    Page.setpageKey2("");
    Page.setopra("");
	String[] file;
	String sVaild="1",sMust="0";//\校验位\必填页面	sMust="1"时先保存再翻页，sMust="0" 可以直接翻页

	file= new String[]{"ggxkz_fmxx.jsp","封面信息",sVaild,sMust}; 
	Page.addPage(file);	
	file= new String[]{"ggxkz_hdsx.jsp","核对事项",sVaild}; //页面地址\名称\校验位\必填页面
	Page.addPage(file);				
	//file= new String[]{"ggxkz_gdxx.jsp","股东(发起人)",sVaild};
	//Page.addPage(file);
	//file= new String[]{"ggxkz_dwtz.jsp","对外投资情况",sVaild};
	//Page.addPage(file);
	file= new String[]{"ggxkz_zsxx_list.jsp","资格证书",sVaild};
	Page.addPage(file);
	file= new String[]{"ggxkz_fzjg_list.jsp","分支机构",sVaild};
	Page.addPage(file);
	file= new String[]{"ggxkz_jysb_list.jsp","经营设备",sVaild};
	Page.addPage(file);
	file= new String[]{"ggxkz_glzd.jsp","管理制度",sVaild};
	Page.addPage(file);
	file= new String[]{"ggxkz_jbjyqk.jsp","经营信息",sVaild};
	Page.addPage(file);	
	file= new String[]{"ggxkz_qtjyqk.jsp","其他经营信息",sVaild};
	Page.addPage(file);	
	file= new String[]{"ggxkz_blxx.jsp","广告统计信息",sVaild};
	Page.addPage(file);	
	file= new String[]{"ggxkz_hcqk.jsp","核查信息",sVaild};
	Page.addPage(file);
	String rp="",bt="返回预审列表";	
	if(SIGN.equals("1")){
		rp=SysUrlForm.getReturnPage("ggxkz_njcx_list.jsp");
	}else if(SIGN.equals("3")){
		rp=SysUrlForm.getReturnPage("ggxkz_ysbl_list.jsp");
	}else{
		rp=SysUrlForm.getReturnPage("ggxkz_ys_list.jsp");
	}
	file= new String[]{"JavaScript:location.href='"+rp+"'",bt,"1"};
	Page.addCmd(file);
	file=Page.getFirstPage();
	if (file!=null)
	{ 
		response.sendRedirect( file[0] );	//跳转页面
	}

%>