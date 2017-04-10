<%@page import="com.macrosoft.icms.ggdj.GgdjbgxxSq"%>
<%@page import="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"%>
<%@page import="com.macrosoft.icms.ggdj.GgdjBgMtb"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%
	request.setCharacterEncoding("GBK");
%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="ggdjJbxxSq" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjJbxxSq">
</jsp:useBean>
<jsp:useBean id="QYDJ_YWSB" scope="page"
	class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ" />
<jsp:useBean id="ggdjMjmc" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjMjmc" />
<jsp:useBean id="ggdjBgsx" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjbgxxSq" />
<%@ page import="com.macrosoft.icms.util.SYS_BHBM"%>
<html>
<head>
<title>数据保存</title>
</head>
<body>
	<%
		String parentOption = "parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
		String sqxxId = Page.getSqxxId();
		String[] sALTITEM = request.getParameterValues("ALTITEM");
		if (sALTITEM == null) {
			out.print(SysUtility.setAlertScript("请选择变更内容!", "parent.window.location.reload();"));
			return;
		}
		//		boolean mediaChange = false;
		boolean IfFirst = false;
		boolean bl = false;
		String[] file;
		String sVaild = "1", sMust = "0";//\校验位\必填页面	sMust="1"时先保存再翻页，sMust="0" 可以直接翻页
		if (sqxxId.equals("")) {
			sVaild = "0";
			sMust = "1";
		}
		ggdjJbxxSq.setId(sqxxId);
		ggdjJbxxSq.loadDataFromDb(); //从正式库加载数据
		String OPENO = Page.getOPENO();

		QYDJ_YWSB_SQ ywsb = new QYDJ_YWSB_SQ();
		ywsb.setOPENO(OPENO);
		boolean hasYwsb = ywsb.doCount();
		if (!hasYwsb) {
			ywsb.setENTNAME(new String(ggdjJbxxSq.getEntName().getBytes("GBK"), "ISO8859-1"));
			ywsb.setENTTYPE(new String(ggdjJbxxSq.getEntType().getBytes("GBK"), "ISO8859-1"));
			if(StringUtils.isEmpty(ywsb.getSTATUS())) {
				ywsb.setSTATUS("0");
			}
			ywsb.setLEREP(ggdjJbxxSq.getLerep());
			ywsb.setLOGINID(webuser.getLOGINID());
			ywsb.setOPETYPE("30");
			ywsb.setCDDL("9");
			ywsb.setREGORG(icms.getCURRENTUNIT());
			ywsb.setAPPDATE(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			ywsb.doAdd();
		} else {
			ywsb.doSelect();
			ywsb.setENTNAME(new String(ggdjJbxxSq.getEntName().getBytes("GBK"), "ISO8859-1"));
			ywsb.setENTTYPE(new String(ggdjJbxxSq.getEntType().getBytes("GBK"), "ISO8859-1"));
			if(StringUtils.isEmpty(ywsb.getSTATUS())) {
				ywsb.setSTATUS("0");
			}
			ywsb.setLEREP(ggdjJbxxSq.getLerep());
			ywsb.setLOGINID(webuser.getLOGINID());
			ywsb.setOPETYPE("30");
		//	ywsb.setAPPDATE(new SimpleDateFormat("yyy-MM-dd").format(new Date()));
			ywsb.doModify();
		}

		String alttime;
		GgdjBgMtb bgMtb = new GgdjBgMtb();
		bgMtb.setOpeno(OPENO);
		bgMtb.loadDataByOpeno();
		if (bgMtb.getId() == null) {
			ggdjBgsx.setSqxxid(sqxxId);
			ggdjBgsx.queryAlttime();
			alttime = ggdjBgsx.getAlttime();
			bgMtb.setId(SysUtility.getUUID20());
			bgMtb.setEntName(ggdjJbxxSq.getEntName());
			bgMtb.setLerep(ggdjJbxxSq.getLerep());
			bgMtb.setOpeno(OPENO);
			bgMtb.setSqxxId(sqxxId);
			bgMtb.setAltTime(alttime);
			bgMtb.doInsert();
		}
		alttime = bgMtb.getAltTime();

		//if(OPENO.equals("")|| OPENO==null){//第一次保存，生成新的业务编号MB开头
		//	OPENO=SYS_BHBM.CREATEBH(2,request.getParameter("REGORG"));
		//	Page.setOPENO(OPENO);//重新设置业务编号		
		//	IfFirst=true;
		//}
		//删除原来的变更信息
		//ggdjBgsx.setSqxxid(sqxxId);
		//ggdjBgsx.setAlttime(alttime);
		//ggdjBgsx.doDelete();

		// 通过变更信息ID删除之前的变更信息
		ggdjBgsx.setBgxxId(bgMtb.getId());
		ggdjBgsx.doDeleteByBgxxId();

		String sqlMjxx = "";
		//循环遍历填写的变更事项
		for (int i = 0; i < sALTITEM.length; i++) {
			if ("03".equals( sALTITEM[i])) {
				String[] mediabes = request.getParameterValues("mediabe");
				String[] mediaafs = request.getParameterValues("mediaaf");
				for (int j = 0; j < mediaafs.length; j++) {
					ggdjBgsx.setId(SysUtility.getUUID20());
					ggdjBgsx.setBgxxId(bgMtb.getId());
					ggdjBgsx.setSqxxid(sqxxId);
					ggdjBgsx.setAlttime(alttime);
					ggdjBgsx.setAltaf(SysUtility.doPreProcess(mediaafs[j]));
					ggdjBgsx.setAltbe(SysUtility.doPreProcess(mediabes[j]));
					ggdjBgsx.setAltitem("03");
					//ggdjBgsx.setAltdate(webuser.getCurrentDate());
					bl = ggdjBgsx.doAdd();
					if (!bl) {
						out.print(SysUtility.setAlertScript("媒介名称变更信息添加失败!", "parent.window.location.reload();"));
						return;
					}
				}

			} else if ("06".equals(sALTITEM[i])) {
			//	String opfrombe = SysUtility.doPreProcess(request.getParameter("opfrombe"));
				String optobe = SysUtility.doPreProcess(request.getParameter("optobe"));
			//	String opfromaf = SysUtility.doPreProcess(request.getParameter("opfromaf"));
				String optoaf = SysUtility.doPreProcess(request.getParameter("optoaf"));
				ggdjBgsx.setId(SysUtility.getUUID20());
				ggdjBgsx.setBgxxId(bgMtb.getId());
				ggdjBgsx.setSqxxid(sqxxId);
				ggdjBgsx.setAlttime(alttime);
			//	ggdjBgsx.setAltaf(opfromaf + "," + optoaf);
			//	ggdjBgsx.setAltbe(opfrombe + "," + optobe);
				ggdjBgsx.setAltbe(optobe);
				ggdjBgsx.setAltaf(optoaf);
				ggdjBgsx.setAltitem("06");
				//ggdjBgsx.setAltdate(webuser.getCurrentDate());
				bl = ggdjBgsx.doAdd();
				if (!bl) {
					out.print(SysUtility.setAlertScript("有限期限变更信息添加失败!", "parent.window.location.reload();"));
					return;
				}
			} else {
				String ALTITEM = sALTITEM[i];
				String befor = "ALTBE" + ALTITEM;
				String after = "ALTAF" + ALTITEM;
				String ALTAFTER = ggdjBgsx.doPreProcess(ggdjBgsx.convertCode(request.getParameter(after)));
				//变更事项表数据保存
				ggdjBgsx.setId(SysUtility.getUUID20());
				ggdjBgsx.setBgxxId(bgMtb.getId());
				ggdjBgsx.setSqxxid(sqxxId);
				ggdjBgsx.setAlttime(alttime);
				ggdjBgsx.setAltaf(request.getParameter(after));
				ggdjBgsx.setAltbe(request.getParameter(befor));
				ggdjBgsx.setAltitem(ALTITEM);
				//ggdjBgsx.setAltdate(webuser.getCurrentDate());
				bl = ggdjBgsx.doAdd();
				if (!bl) {
					out.print(SysUtility.setAlertScript("变更信息添加失败!", "parent.window.location.reload();"));
					return;
				}

				//	if (!mediaChange) {
				//		ggdjBgsx.setMediaChange(ALTITEM);
				//		mediaChange = ggdjBgsx.getMediaChange();
				//	}
				//	if (!bl) {
				//		out.print(SysUtility.setAlertScript("变更信息添加失败!", "parent.window.location.reload();"));
				//		return;
				//	}
			}
		}
		//	Page.clearPage();
		//	file = new String[] { "ggdj_bgsx.jsp", "变更信息", sVaild, sMust }; //页面地址\名称\校验位 
		//	Page.addPage(file);
		//	if(mediaChange){
		//		file= new String[]{"ggdj_mjmc.jsp","媒介批准文件",sVaild};
		//		Page.addPage(file);
		//	}	
		//	file = new String[] { "ggdj_bgfjxx.jsp", "文件列表", sVaild };
		//	Page.addPage(file);
		if (bl) {
			Page.setMusted(0);
			out.print(SysUtility.setAlertScript("保存成功!",
					"parent.window.location.href='" + Page.getNextPage()[0] + "';"));
		} else {
			out.print(SysUtility.setAlertScript("保存失败!", parentOption));
		}
	%>
</body>
</html>