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
    Page.setpageKey(ADBULICNO); //��澭Ӫ���֤��
    Page.setipageKey(INSYEAR);//������
    Page.setpageKey1(SIGN);
    Page.setpageKey3("");
    Page.setpageKey2("");
    Page.setopra("");
	String[] file;
	String sVaild="1",sMust="0";//\У��λ\����ҳ��	sMust="1"ʱ�ȱ����ٷ�ҳ��sMust="0" ����ֱ�ӷ�ҳ

	file= new String[]{"ggxkz_fmxx.jsp","������Ϣ",sVaild,sMust}; 
	Page.addPage(file);	
	file= new String[]{"ggxkz_hdsx.jsp","�˶�����",sVaild}; //ҳ���ַ\����\У��λ\����ҳ��
	Page.addPage(file);				
	//file= new String[]{"ggxkz_gdxx.jsp","�ɶ�(������)",sVaild};
	//Page.addPage(file);
	//file= new String[]{"ggxkz_dwtz.jsp","����Ͷ�����",sVaild};
	//Page.addPage(file);
	file= new String[]{"ggxkz_zsxx_list.jsp","�ʸ�֤��",sVaild};
	Page.addPage(file);
	file= new String[]{"ggxkz_fzjg_list.jsp","��֧����",sVaild};
	Page.addPage(file);
	file= new String[]{"ggxkz_jysb_list.jsp","��Ӫ�豸",sVaild};
	Page.addPage(file);
	file= new String[]{"ggxkz_glzd.jsp","�����ƶ�",sVaild};
	Page.addPage(file);
	file= new String[]{"ggxkz_jbjyqk.jsp","��Ӫ��Ϣ",sVaild};
	Page.addPage(file);	
	file= new String[]{"ggxkz_qtjyqk.jsp","������Ӫ��Ϣ",sVaild};
	Page.addPage(file);	
	file= new String[]{"ggxkz_blxx.jsp","���ͳ����Ϣ",sVaild};
	Page.addPage(file);	
	file= new String[]{"ggxkz_hcqk.jsp","�˲���Ϣ",sVaild};
	Page.addPage(file);
	String rp="",bt="����Ԥ���б�";	
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
		response.sendRedirect( file[0] );	//��תҳ��
	}

%>