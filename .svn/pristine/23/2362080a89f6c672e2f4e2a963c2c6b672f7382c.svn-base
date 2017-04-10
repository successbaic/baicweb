<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="com.macrosoft.icms.ggdj.GgdjbgxxSq"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<%
	request.setCharacterEncoding("GBK");
%>
<jsp:useBean id="ggdjJbxxSq" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjJbxxSq" />
<jsp:useBean id="ggdjZxxx" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjZxxx" />
<jsp:useBean id="ggdjBgMtb" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjBgMtb" />
<jsp:useBean id="ggdjLxrxx" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjLxrxx">
	<jsp:setProperty name="ggdjLxrxx" property="*" />
</jsp:useBean>
<jsp:useBean id="QYDJ_YWSB" scope="page"
	class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ" />

<%
	Boolean retSave; // 保存结果
	String opeType = Page.getOPETYPE(); // 业务类型
	String openo = Page.getOPENO(); // 业务主键
	String sqxxId = Page.getSqxxId();
	// 保存申请人信息
	try {
		ggdjLxrxx.setOpeno(openo);
		boolean hasLxr = ggdjLxrxx.doCount();
		if (hasLxr) {
			retSave = ggdjLxrxx.doUpdate();
		} else {
			ggdjLxrxx.setId(SysUtility.getUUID20());
			retSave = ggdjLxrxx.doInsert();
		}

	} catch (Exception e) {
		retSave = false;
	}
	// 保存业务表信息
	if (retSave) {
		try {
			QYDJ_YWSB.setOPENO(openo);
			boolean hasYwsb = QYDJ_YWSB.doCount();
			if (!hasYwsb) {
				if (!StringUtils.isEmpty(sqxxId)) {
					ggdjJbxxSq.setId(sqxxId);
					ggdjJbxxSq.loadDataFromDb(); // 从正式库加载数据
					QYDJ_YWSB.setENTNAME(new String(ggdjJbxxSq.getEntName().getBytes("GBK"), "ISO8859-1"));
					QYDJ_YWSB.setLEREP(new String(ggdjJbxxSq.getLerep().getBytes("GBK"), "ISO8859-1"));
				} else {
					QYDJ_YWSB.setENTNAME(ggdjLxrxx.getComName());
					QYDJ_YWSB.setLEREP(ggdjLxrxx.getLinkMan());
				}
				QYDJ_YWSB.setREGORG(icms.getCURRENTUNIT());
				QYDJ_YWSB.setCDDL("9");
				QYDJ_YWSB.setSTATUS("0");
				QYDJ_YWSB.setLOGINID(webuser.getLOGINID());
				QYDJ_YWSB.setOPETYPE(opeType);
				QYDJ_YWSB.setAPPDATE(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
				retSave = QYDJ_YWSB.doAdd();
			}
		} catch (Exception e) {
			retSave = false;
		}
	}
	// 保存业务个性化信息
	if (retSave) {
		try {
			// 设立
			if ("20".equals(opeType)) {
				ggdjJbxxSq.setId(openo);
				boolean hasJbxx = ggdjJbxxSq.doCount();
				if (!hasJbxx) {
					ggdjJbxxSq.setEntName(ggdjLxrxx.getComName());
					ggdjJbxxSq.setLerep(ggdjLxrxx.getLinkMan());
					ggdjJbxxSq.setCertNo(Page.getCertNo());
					ggdjJbxxSq.doInsert();
				} else {
					ggdjJbxxSq.loadData();
					// 通过审核机关是否有值，判断基本信息是否执行过保存
					if(StringUtils.isEmpty(ggdjJbxxSq.getAccOrg())) {
						ggdjJbxxSq.setEntName(ggdjLxrxx.getComName());
						ggdjJbxxSq.setLerep(ggdjLxrxx.getLinkMan());
						ggdjJbxxSq.doUpdate();
					}					
				}
			}
			// 变更
			if ("30".equals(opeType)) {
				ggdjBgMtb.setOpeno(openo);
				boolean hasBgMtb = ggdjBgMtb.doCountByOpeno();
				if (!hasBgMtb) {
					GgdjbgxxSq bgxx = new GgdjbgxxSq();
					bgxx.setSqxxid(sqxxId);
					bgxx.queryAlttime();
					String alttime = bgxx.getAlttime();
					ggdjBgMtb.setId(SysUtility.getUUID20());
					ggdjBgMtb.setEntName(new String(ggdjJbxxSq.getEntName().getBytes("GBK"), "ISO8859-1"));
					ggdjBgMtb.setLerep(new String(ggdjJbxxSq.getLerep().getBytes("GBK"), "ISO8859-1"));
					ggdjBgMtb.setOpeno(openo);
					ggdjBgMtb.setSqxxId(sqxxId);
					ggdjBgMtb.setAltTime(alttime);
					ggdjBgMtb.doInsert();
				}
			}
			// 注销
			if ("50".equals(opeType)) {
				ggdjZxxx.setId(openo);
				boolean hasZxxx = ggdjZxxx.doCount();
				if (!hasZxxx) {
					ggdjZxxx.setSqxxId(sqxxId);
					ggdjZxxx.doInsert();
				}
			}

		} catch (Exception e) {
			retSave = false;
		}
	}
	// 返回结果提示
	if (retSave) {
		out.print(SysUtility.setAlertScript("数据保存成功!",
				"parent.window.location.href='" + Page.getNextPage()[0] + "'"));
		Page.setMusted(0); //该页已保存，可以进入下一页
	} else {
		out.print(SysUtility.setAlertScript("业务申报数据保存失败!", ""));
		return;
	}
%>
<html>
<head>
</head>
<body>
</body>
</html>