<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.macrosoft.icms.ggdj.GgdjBgMtb"%>
<%@page import="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"%>
<%@page import="com.macrosoft.icms.util.SYS_BHBM"%>

<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.PageShow"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="ggdjBgsx" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjbgxxSq" />

<%
	String OPENO = Page.getOPENO();
	//   String ENTTYPE=Page.getENTTYPE();
	String OPETYPE = Page.getOPETYPE();
	String sqxxId = Page.getSqxxId();

	int num = 2;
//	if (Page.getOPETYPE().equals("20")) {
//		num = 1;
//	}
	if (Page.getSTEP() >= num) {

	} else {
		Page.setSTEP(num);
	}
	String sVaild = "1", sMust = "0";//\У��λ\����ҳ��	sMust="1"ʱ�ȱ����ٷ�ҳ��sMust="0" ����ֱ�ӷ�ҳ
	if (OPENO == null || OPENO.equals("")) {
		sVaild = "0";
		sMust = "1";
		OPENO = SysUtility.getUUID20();
		Page.setOPENO(OPENO);//��������ҵ����		
	}

	Page.clearPage();
	Page.clearPageCmd();

	String[] file;
	file = new String[] { "ggdj_lxrxx.jsp", "��������Ϣ", sVaild, sMust }; //ҳ���ַ\����\У��λ 	
	Page.addPage(file);
	if (OPETYPE.equals("20")) {
		String certNo = request.getParameter("certNo");
		if(!StringUtils.isEmpty(certNo)) {
			Page.setCertNo(certNo);
		}
		file = new String[] { "ggdj_jbxx.jsp", "������Ϣ", sVaild, sMust }; //ҳ���ַ\����\У��λ 
		Page.addPage(file);
		file = new String[] { "ggdj_ryqk.jsp", "��Ա��Ϣ", sVaild };
		Page.addPage(file);
		file = new String[] { "ggdj_fjxx_list.jsp", "������Ϣ", sVaild };
		Page.addPage(file);
	} else if (OPETYPE.equals("30")) {
		file = new String[] { "ggdj_bgsx.jsp", "�����Ϣ", sVaild, sMust }; //ҳ���ַ\����\У��λ 
		Page.addPage(file);
		if (sqxxId == null) {
			GgdjBgMtb bgMtb = new GgdjBgMtb();
			bgMtb.setOpeno(OPENO);
			bgMtb.loadDataByOpeno();
			sqxxId = bgMtb.getSqxxId();
			Page.setSqxxId(sqxxId);
		}
		file = new String[] { "ggdj_fjxx_list.jsp", "������Ϣ", sVaild };
		Page.addPage(file);
	} else if (OPETYPE.equals("50")) {
		file = new String[] { "ggdj_zxxx.jsp", "ע����Ϣ", sVaild, sMust }; //ҳ���ַ\����\У��λ 
		Page.addPage(file);
	}
	file = Page.getFirstPage();
	if (file != null) {
		response.sendRedirect(file[0]); //��תҳ��
	}
%>
