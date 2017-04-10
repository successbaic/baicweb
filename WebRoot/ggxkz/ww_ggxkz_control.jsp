<%@include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.SysPage"/>
<jsp:useBean id="GGGL_JYDW_JBXX" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JBXX"/>
<%  
	String ADBULICNO=GGGL_USER.getADBULICNO();
	String sINSYEAR=GGGL_USER.getINSYEAR()+"";
	String SIGN="1";
	int INSYEAR=Integer.parseInt(sINSYEAR);
	GGGL_JYDW_JBXX.setADBULICNO(ADBULICNO);
	GGGL_JYDW_JBXX.setINSYEAR(INSYEAR);
	GGGL_JYDW_JBXX.doSelect();
	if(GGGL_JYDW_JBXX.getANCHETYPE().equals("")
	   ||GGGL_JYDW_JBXX.getANCHETYPE().equals("0")
	   ||GGGL_JYDW_JBXX.getANCHETYPE().equals("3")
	   ){
		SIGN="";
	}
    Page.init();
    Page.setpageKey(ADBULICNO); //广告经营许可证号
    Page.setipageKey(INSYEAR);//检查年度
    Page.setpageKey1(SIGN);
    Page.setpageKey3("WW");
    Page.setpageKey2("");
    Page.setopra("");    
	String[] file;
	String sVaild="1",sMust="0";//\校验位\必填页面	sMust="1"时先保存再翻页，sMust="0" 可以直接翻页
	if(GGGL_JYDW_JBXX.getANCHETYPE().equals("")){
		sVaild="0";sMust="1";
	}
	
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
	
	String rp="welcome.jsp",bt="返回首页";		
	file= new String[]{"JavaScript:parent.window.location.href='"+rp+"'",bt,"1"};
	Page.addCmd(file);
	file=Page.getFirstPage();
	if (file!=null)
	{ 
		response.sendRedirect( file[0] );	//跳转页面
	}

%>